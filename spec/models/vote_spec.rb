require 'spec_helper'

describe Vote do


  let(:vote) { FactoryGirl.create(:vote) }
  let(:invalid_vote) { FactoryGirl.build(:invalid_vote) }

  context '#initialize' do 

    context "user associations" do

      it "is invalid if it's not associated to a real user" do
        invalid_vote.should_not be_valid
      end

      it { should belong_to(:user) }

      it "is associated to a user" do
        vote.user.should_not be_nil
        vote.should be_valid
      end
    end

    context "pitch associations" do

      it "is invalid if it's not associated to a real pitch" do
        invalid_vote.should_not be_valid
      end

      it { should belong_to(:pitch) }

      it "is associated to a pitch" do
        vote.pitch.should_not be_nil
        vote.should be_valid
      end
    end
    
    context "is negative or positive" do

      it "is not created without a up or down vote" do
        vote.upvote = nil
        vote.should_not be_valid
      end

      it "is created with an up vote" do
        vote.should be_valid
      end     

      it "is created with a down vote" do
        vote.upvote = false
        vote.should be_valid
      end
    end
    
    it "is unique to a given user for a given pitch" do
      second_vote = vote
      vote.save
      expect {second_vote.create }.to raise_error
    end
  end
end
