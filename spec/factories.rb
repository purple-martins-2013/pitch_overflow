require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:title) { Faker::Company.bs.titleize }
    sequence(:content) { Faker::Lorem.sentences(sentence_count = 3) }
  end

end
