require 'spec_helper'

describe PitchesController do

  describe "pitches#index" do

    it "should have a successful HTTP response" do
      pitch = create(:pitch)
      get :index
      expect(assigns(:pitches)).to eq([pitch])
    end
  end

  describe "pitches#show" do
    it "should have a successful HTTP response"
  end

  describe "pitches#new" do
    xit "should have a successful HTTP response" do
      get :new
      response.status.should eq 200
    end
  end
end
