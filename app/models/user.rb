class User < ActiveRecord::Base

  has_many :pitches
  has_many :reactions

  validates_presence_of :username, :provider, :uid

  def self.create_from_omniauth(omniauth)
    User.new.tap do |user|
      user.uid = omniauth["uid"]
      user.username = omniauth["info"]["nickname"]
      user.provider = "github"
      # user.email = omniauth["info"]["email"]
      user.save!
    end
  end
end
