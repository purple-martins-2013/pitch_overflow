require 'spec_helper'

describe 'user reacts to a pitch' do
  include LoginHelper

  it 'should show the reaction on the page' do
    user = create(:user)
    login(user)

    pitch = create(:pitch)

    visit pitch_path(pitch)

    within ".new_reaction" do
      fill_in 'reaction_content', with: 'your idea is freaking phenomenal'
      click_on 'submit_reaction'
    end

    within "#reaction-#{Reaction.last.id}" do
      expect(page).to have_content 'your idea is freaking phenomenal'
      expect(page).to have_content user.username
    end
  end
end
