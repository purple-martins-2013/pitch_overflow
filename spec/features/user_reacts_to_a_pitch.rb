require 'spec_helper'

describe 'user reacts to a pitch' do
  it 'should show the reaction on the page' do
    user = create(:user)
    # REFACTOR: is this the only way i can set session
    # variables when using capybara?
    page.set_rack_session(user_id: user.id)
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
