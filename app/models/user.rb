# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string(255)      default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string(255)
#  last_sign_in_ip     :string(255)
#  provider            :string(255)
#  uid                 :string(255)
#  name                :string(255)
#  profile             :json
#  created_at          :datetime
#  updated_at          :datetime
#  credentials         :hstore           default({}), not null
#

require 'never_nil'

class User < ActiveRecord::Base

  #-----------------------------------------------------------------------------
  # Devise
  #-----------------------------------------------------------------------------

  devise :registerable, :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:rdio]

  #-----------------------------------------------------------------------------
  # Relationships
  #-----------------------------------------------------------------------------

  has_and_belongs_to_many :artists

  #-----------------------------------------------------------------------------
  # Class Methods
  #-----------------------------------------------------------------------------

  def self.find_for_rdio_oauth(auth, signed_in_resource = nil)
    (User.where(provider: auth.provider, uid: auth.uid).first || User.new).tap do |user|
      user.update!(
        name:        auth.extra.raw_info.displayName,
        credentials: auth.credentials.to_h,
        provider:    auth.provider,
        uid:         auth.uid,
        profile:     auth.extra.raw_info.to_h
      )
    end
  end

  def self.from_rdio(user)
    return user if user.is_a?(User)
    auth = NeverNil.new(
      credentials: {},
      provider: 'rdio',
      uid:      user['key'],
      extra: {
        raw_info: {
          displayName: [user['firstName'], user['lastName']].join(' ')
        }
      }
    )
    find_for_rdio_oauth(auth)
  end

end
