require 'spec_helper'

describe User do 
  
  let (:mock_omniauth) { {"provider" => "github", "uid" => "1234567", "info" => { "nickname" => "test-user"}}}
  
  context '#create_from_omniauth' do 

    it "creates a new user" do
      User.create_from_omniauth(mock_omniauth)
      new_user = User.find_by_username("test-user")
      new_user.should_not be nil
    end

    it "does not create a user if username is missing" do
      mock_omniauth["info"]["nickname"] = nil
      expect { User.create_from_omniauth(mock_omniauth) }.to raise_error(ActiveRecord::RecordInvalid)
    end

     it "does not create a user if uid is missing" do
      mock_omniauth["uid"] = nil
      expect { User.create_from_omniauth(mock_omniauth) }.to raise_error(ActiveRecord::RecordInvalid)
    end

     it "does not create a user if provider is missing" do
      mock_omniauth["provider"] = nil
      expect { User.create_from_omniauth(mock_omniauth) }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

  context '#initialize' do 

    let(:user) { FactoryGirl.create(:user) }

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
