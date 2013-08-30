require 'spec_helper'

describe Pitch do

  let(:pitch) { create(:pitch, { title: "my awesome startup idea" }) }
  
  it "titleizes the #title before saving" do
    pitch.title.should eq "My Awesome Startup Idea"
  end

  it "doesn't allow you to have an empty #title"
  it "doesn't allow you to have an empty #content"
  it "defaults #score to 0"
end
