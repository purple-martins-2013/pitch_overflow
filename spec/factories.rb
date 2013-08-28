require 'faker'

FactoryGirl.define do
  factory :pitch do
    sequence(:title) { Faker::Company.bs.titleize }
    sequence(:content) { Faker::Lorem.sentences(sentence_count = 3).join(' ') }
  end

  factory :reaction do
    sequence(:content) { Faker::Lorem.sentence(sentence_count = 2).join(' ')}
  end
  
end
