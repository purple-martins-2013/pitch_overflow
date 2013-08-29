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

    it 'orders pitches by votes in descending order'
  end

  describe "pitches#show" do
    it 'exposes the right pitch' do
      get :show, { id: pitch.id }
      expect(assigns(:pitch)).to eq pitch
    end
  end

  describe "pitches#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "pitches#create" do
    it "creates a new Pitch object" do
      post :create,{ pitch: { title: "My amazing idea", content: "It will be uber successful" }}
      expect(assigns(:pitch)).to be_an_instance_of(Pitch)
    end
  end
end

