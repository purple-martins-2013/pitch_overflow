class User < ActiveRecord::Base

  validates_presence_of :username, :provider, :uid


end
