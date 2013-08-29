class User < ActiveRecord::Base

  has_many :pitches, :reactions

  validates_presence_of :username, :provider, :uid


end
