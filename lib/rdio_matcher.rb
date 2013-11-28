require 'rdio_api'

class RdioMatcher


  attr_reader :client

  #-----------------------------------------------------------------------------
  # Class Methods
  #-----------------------------------------------------------------------------


  #-----------------------------------------------------------------------------
  # Constructor
  #-----------------------------------------------------------------------------

  def initialize(user)
    @user   = user
    @client = RdioApi.new(
      consumer_key:    ENV['RDIO_API_KEY'],
      consumer_secret: ENV['RDIO_API_SECRET'],
      access_token:    user.credentials['token'],
      access_secret:   user.credentials['secret']
    )
  end

  #-----------------------------------------------------------------------------
  # Instance Methods
  #-----------------------------------------------------------------------------

  def analyze
    load_heavy_rotation_for(@user)
    build_relationships_for(@user) do |friend|
      load_heavy_rotation_for(friend)
      build_relationships_for(friend) do |friend_of_friend|
        load_heavy_rotation_for(friend_of_friend)
      end
    end
  end

  #-----------------------------------------------------------------------------
  # Protected Methods
  #-----------------------------------------------------------------------------

  protected

  def build_relationships_for(user, &block)
    followers = client.userFollowers(user: user.uid, count: 1000).map { |u| User.from_rdio(u) }
    following = client.userFollowing(user: user.uid, count: 1000).map { |u| User.from_rdio(u) }

    (followers || []).each do |u|
      Relationship.find_or_create_by! followee: user, follower: u
      yield u if block_given?
    end

    (following || []).each do |u|
      Relationship.find_or_create_by! followee: u, follower: user
      yield u if block_given?
    end

    user
  end

  def load_heavy_rotation_for(user)
    user = User.from_rdio(user)

    rotation = client.getHeavyRotation(
      count: 50,
      type:  'artists',
      user:  user.uid
    )
    (rotation || []).each do |a|
      artist = Artist.find_or_initialize_by(source: 'rdio', source_id: a['key'])
      if artist.new_record?
        artist.assign_attributes(
          image_url: a['icon'],
          name:      a['name'],
          url:       a['shortUrl']
        )
      end

      user.artists << artist
    end

    user
  end
end
