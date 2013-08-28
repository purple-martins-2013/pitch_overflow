require 'spec_helper'

describe Pitch do

  let(:pitch) { Pitch.create(title: "my awesome startup idea", content: content) }
  let(:content) { "Lorem ipsum dolor sit amet, laboris in ante ligula fusce, vel convallis at convallis nulla. Erat mi cras luctus sit, mauris elit nibh auctor nisl. Fermentum ipsum nisl ipsum nulla, proin amet ut tempus, rhoncus felis mi senectus, ornare diam ut semper." }

  it "titleizes the title before saving" do
    pitch.title.should eq "My Awesome Startup Idea"
  end

  describe "#title" do
    it "returns the title of the pitch" do
      pitch.title.should eq "My Awesome Startup Idea"
    end

  end
  
  describe "#content" do
    
    it "returns the content of the pitch" do
      pitch.content.should eq content
    end

  end

  describe "#score" do
    
    context "when a pitch has no votes" do
      it "return a score of 0" do
        pitch.score.should eq 0
      end

    end

    context "when a pitch has votes" do
      
      pitch.upvote!
      pitch.upvote!
      pitch.downvote!
      pitch.upvote!

      it "returns the sum of the upvotes and downvotes" do
        pitch.score.should eq 2
      end
    
    end
  end

  describe "#upvote!" do
    it "increments the score by 1" do
      pitch.upvote!
      pitch.score.should eq 1
    end
  end

  describe "#downvote!" do
    it "decrements the score by 1" do
      pitch.downvote!
      pitch.score.should eq -1
    end
  end
end
