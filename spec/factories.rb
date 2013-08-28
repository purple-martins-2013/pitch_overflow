require 'faker'

FactoryGirl.define do
  factory :reaction do
    sequence(:content) { Faker::Lorem.sentence(sentence_count = 2).join(' ')}
  end  
end
