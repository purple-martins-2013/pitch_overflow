require 'spec_helper'

describe PitchesController do

  describe "pitches#index" do

    it "@pitches should contain all saved pitches" do
      pitch = create(:pitch)
      get :index
      expect(assigns(:pitches)).to eq([pitch])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
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
