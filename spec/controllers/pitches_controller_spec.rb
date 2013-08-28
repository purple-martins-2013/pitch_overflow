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
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  # describe "pitches#create" do
  #   it "creates a new Pitch object" do
  #     post :create,{ pitch: { title: "My amazing idea", content: "It will be uber successful" }}
  #     assigns[:pitch].should be_a_new(Pitch)
  #   end
  # end
end


# post :create, :thing => { :name => "Illegal Value" }
# assigns(:thing).should be_a_new(Thing).with(:name => nil)
