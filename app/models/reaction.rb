class Reaction < ActiveRecord::Base
  belongs_to :pitch
  belongs_to :user

  validates :content, presence: true
end
