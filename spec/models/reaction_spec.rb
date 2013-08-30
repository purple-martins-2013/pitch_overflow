require 'spec_helper'

describe Reaction do

  let(:pitch) { FactoryGirl.create(:pitch) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    @reaction = pitch.reactions.build(content: 'Example content', score: 2, user: user)
  end

  subject {@reaction}

  it {should respond_to(:content)}
  it {should respond_to(:score)}
  it {should respond_to(:pitch_id)}

  describe "associations" do
    it "belongs to a pitch" do
      @reaction.pitch_id.should_not be_nil
    end

    it "belongs to a user" do
      @reaction.user_id.should_not be_nil
    end
  end

  context "when content is blank" do
    before { @reaction.content = nil }
    it { should_not be_valid }
  end

  describe "default values" do
    it 'should have a default score of zero' do
      reaction = Reaction.create(content: 'fofo')
      expect(reaction.score).to eq 0
    end
  end

  describe "pitch relationship" do
    it 'should be assigned to a pitch' do
      expect(@reaction.pitch).to eq pitch
    end
  end

end
