require 'spec_helper'

describe 'user reacts to a pitch' do
  it 'should show the reaction on the page' do
    user = create(:user)
    # REFACTOR: is this the only way i can set session
    # variables when using capybara?
    page.set_rack_session(user_id: user.id)
    pitch = create(:pitch)

    visit pitch_path(pitch)

    fill_in 'reaction_content', with: 'your idea is freaking phenomenal'

    expect(page).to have_content 'your idea is freaking phenomenal'
  end
end
