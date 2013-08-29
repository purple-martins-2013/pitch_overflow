require 'faker'

FactoryGirl.define do
  factory :vote do
    user
    pitch
    upvote true
  end

  factory :invalid_vote, :class => Vote do
    user_id "111"
    pitch_id "111"
    upvote true
  end
end
