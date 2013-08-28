require 'spec_helper'


describe ReactionsController do
  let(:pitch) { FactoryGirl.create(:pitch) }
  let(:reaction) { pitch.reactions.build(content: 'example')}

  describe '#create' do
    context "when I try to create a reaction with empty params" do
      it "should raise an error" do
        expect{ post :create, { pitch_id: pitch.id, reaction: { } } }.to raise_error
      end
    end

    context "when I try to create a reaction with complete params" do
      
      before do
        post :create, { pitch_id: pitch.id, reaction: {
            content: reaction.content
          }
        }
      end

      it "should redirect to the pitch page" do
        expect(response).to redirect_to(pitch_path(pitch))
      end

      it "should create a new reaction" do
        expect(Reaction.last.content).to eq reaction.content
      end

    end
  end
end




