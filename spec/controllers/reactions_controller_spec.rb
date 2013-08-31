require 'spec_helper'


describe ReactionsController do
  let(:pitch) { FactoryGirl.create(:pitch) }
  let(:reaction) { pitch.reactions.build(content: 'example')}

  describe '#create' do

    context "when I'm logged in" do
      include LoginHelper
      before do
        @user = create(:user)
        login(@user)
      end

      describe "when I try to create a reaction with empty params" do
        it "should raise an error" do
          expect{ post :create, { pitch_id: pitch.id, reaction: { } } }.to raise_error
        end
      end

      describe "when I try to create a reaction with complete params" do
        
        before do
          post :create, { pitch_id: pitch.id, reaction: {
              content: reaction.content
            }
          }
        end

        it "should render a partial to show the comment" do
          expect(response).to render_template('pitches/_reaction')
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

    context "when I'm not logged in" do

      describe "when I try to create a reaction" do

       let(:post_action) do
          post :create, { pitch_id: pitch.id, reaction: {
              content: reaction.content
            }
          }
        end

        it "should redirect to the omniauth authorization page" do
          post_action
          expect(response).to redirect_to omniauth_path
        end

        it "should not create a reaction" do
          expect { post_action }.not_to change { Reaction.count }
        end
      end
    end
  end
end




