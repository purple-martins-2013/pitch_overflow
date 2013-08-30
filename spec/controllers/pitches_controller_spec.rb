require 'spec_helper'

describe PitchesController do

  let(:pitch) { create(:pitch) }

  describe "pitches#index" do
    it "@pitches should contain all saved pitches" do
      pitch
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
    include LoginHelper
    before(:each) do
      @user = create(:user)
      login(@user)
      post :create,{ pitch: { title: "My amazing idea", content: "It will be uber successful" }}
    end

    it "assigns the correct title when creating a pitch" do
      expect(assigns(:pitch).title).to eq "My Amazing Idea"
    end

    it "assigns correct content when creating a pitch" do
      expect(assigns(:pitch).content).to eq "It will be uber successful"
    end

    it "assigns the correct user when creating a pitch" do
      expect(assigns(:pitch).user).to eq @user
    end
  end
end

