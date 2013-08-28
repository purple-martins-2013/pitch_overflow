require 'faker'

FactoryGirl.define do
  factory :pitch do
    title Faker::Company.bs
    content Faker::Lorem.sentences(sentence_count = 3).join("\n")
  end

end
