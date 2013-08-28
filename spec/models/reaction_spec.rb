require 'spec_helper'

describe Reaction do

  before do
    @reaction = Reaction.new(content: 'Example content', score: 2)
  end

  subject {@reaction}

  it {should respond_to(:content)}
  it {should respond_to(:score)}

  context "when content is blank" do
    before { @reaction.content = nil }
    it { should_not be_valid }
  end

end
