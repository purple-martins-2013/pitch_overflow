require 'spec_helper'

describe Pitch do

  let(:pitch) { create(:pitch, { title: "my awesome startup idea" }) }
  
  it "titleizes the #title before saving" do
    pitch.title.should eq "My Awesome Startup Idea"
  end

  it "doesn't allow you to have an empty #title"
  it "doesn't allow you to have an empty #content"
  it "defaults #score to 0"

  describe "#upvote!" do
    it "increments the score by 1" do
      pitch.upvote!
      pitch.score.should eq(1)
    end
  end

  describe "#downvote!" do
    it "decrements the score by 1" do
      pitch.downvote!
      pitch.score.should eq(-1)
    end
  end
end
