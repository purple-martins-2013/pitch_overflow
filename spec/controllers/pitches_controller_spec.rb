require 'spec_helper'

describe PitchesController do

  describe "pitches#index" do

    it "should have a successful HTTP response" do
      get :index
      response.status.should eq 200
    end
  end

  describe "pitches#show" do
    it "should have a successful HTTP response" do
      get :show
      response.status.should eq 200
    end
  end

  describe "pitches#new" do
    it "should have a successful HTTP response" do
      get :new
      response.status.should eq 200
    end
  end
end
