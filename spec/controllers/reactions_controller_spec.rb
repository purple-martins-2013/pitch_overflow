require 'spec_helper'


describe ReactionsController do
  let(:pitch) { FactoryGirl.create(:pitch) }
  let(:reaction) { pitch.reaction.build(content: 'example')}

  describe '#create' do
    context "when I try to create a reaction with empty params" do
      it "should redirect to the pitch page" do
        post :create, pitch_id: pitch.id
        expect(response).to redirect_to(pitch_path(pitch))
      end
    end
  end
end




