require 'faker'

FactoryGirl.define do
  factory :vote do
    user_id 1
    pitch_id 1
    upvote true
  end
end
