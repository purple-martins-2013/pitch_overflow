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

      it "should redirect to the root page" do
        expect(response).to redirect_to(root_path(pitch))
      end

      it "should create a new reaction" do
        expect(Reaction.last.content).to eq reaction.content
      end

      it "should not accept a :score parameter" do
        post :create, { pitch_id: pitch.id, reaction: {
            content: reaction.content, score: 10000000
          }
        }
        expect(Reaction.last.score).to eq 0
      end

    end
  end
end




