require 'spec_helper'

describe User do 
  context '#initialize' do 

    let(:user) { FactoryGirl.build(:user) }

    it "must have a username" do
      user.username = nil
      user.should_not be_valid
    end

    it "must have a OAuth provider" do 
      user.provider = nil
      user.should_not be_valid
    end

    it "must have a uid" do
      user.uid = nil
      user.should_not be_valid
    end

    it "is valid if contains username, provider and uid" do
      user.should be_valid
    end

    it "has many pitches" do
      user.should respond_to(:pitches)
    end

    it "has many reactions" do
      user.should respond_to(:reactions)
    end

  end
end
