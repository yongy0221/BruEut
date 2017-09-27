class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  has_many :pointlesses
  has_many :forests
  has_many :markets
  has_many :preports
<<<<<<< HEAD
  has_many :partycomments
  has_many :forestlikes
  has_many :forestdislikes
=======
>>>>>>> 56a5a8f368b6cc782432e3fd2d4edebc23133d40
end
