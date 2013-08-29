class User < ActiveRecord::Base

  has_many :pitches
  has_many :reactions

  validates_presence_of :username, :provider, :uid


end
