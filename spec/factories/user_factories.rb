require 'faker'

FactoryGirl.define do
  factory :user do
    username Faker::Name.first_name
    provider "github"
    uid "000000000"
  end
end
