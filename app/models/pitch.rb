class Pitch < ActiveRecord::Base

  attr_reader :title, :content, :score

  has_many :reactions
  validates_presence_of :title
  validates_presence_of :content

  before_save :titleize_title

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
