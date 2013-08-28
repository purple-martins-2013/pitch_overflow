class Reaction < ActiveRecord::Base
  belongs_to :pitch

  validates :content, presence: true
end
