class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :pitch

  validates_presence_of :user, :pitch
  validates_associated :user, :pitch
  validates_inclusion_of :upvote, :in => [true, false]

end
