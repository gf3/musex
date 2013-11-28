class User < ActiveRecord::Base

  #-----------------------------------------------------------------------------
  # Devise
  #-----------------------------------------------------------------------------

  devise :registerable, :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:rdio]


  #-----------------------------------------------------------------------------
  # Instance Methods
  #-----------------------------------------------------------------------------

  def self.find_for_rdio_oauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    unless user
      user = User.create(
        name:     auth.extra.raw_info.displayName,
        provider: auth.provider,
        uid:      auth.uid,
        profile:  auth.extra.raw_info
      )
    end
    user
  end
end
