class Pitch < ActiveRecord::Base

  before_save :titleize_title

  has_many :reactions
  has_many :votes
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :content

  def upvote!
    self.score += 1
    self.save
  end

  def downvote!
    self.score -= 1
    self.save
  end

  private

  def titleize_title
    self.title = title.titleize
  end
end
