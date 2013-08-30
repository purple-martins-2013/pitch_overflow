class Pitch < ActiveRecord::Base

  before_save :titleize_title

  has_many :reactions
  has_many :votes
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :user

  def score
    votes.select {|vote| vote.upvote == true }.length - votes.select {|vote| vote.upvote == false }.length
  end

  private

  def titleize_title
    self.title = title.titleize
  end
end
