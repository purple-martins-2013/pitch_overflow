require 'spec_helper'

describe PitchesController do

  let(:pitch) { create(:pitch) }

  describe "pitches#index" do

    it "@pitches should contain all saved pitches" do
      get :index
      expect(assigns(:pitches)).to eq([pitch])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    
  end

  describe "pitches#show" do
    it 'exposes the right pitch' do
      get :show, { id: pitch.id }
      expect(assigns(:pitch)).to eq pitch
    end

  end

  describe "pitches#new" do
    xit "should have a successful HTTP response" do
      get :new
      response.status.should eq 200
    end
  end
end
