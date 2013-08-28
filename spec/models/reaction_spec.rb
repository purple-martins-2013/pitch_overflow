require 'spec_helper'

describe Reaction do

  before do
    @reaction = Reaction.new(content: 'Example content', score: 2)
  end

  subject {@reaction}

  it {should respond_to(:content)}
  it {should respond_to(:score)}

end
