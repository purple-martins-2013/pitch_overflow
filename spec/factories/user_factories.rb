require 'faker'

FactoryGirl.define do
  factory :user do
    username Faker::Name.first_name
    provider "github"
    uid random(1000000..9999999).to_s
  end
end
