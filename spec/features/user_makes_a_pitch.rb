require 'spec_helper'

describe 'logged in user makes a pitch' do
  include LoginHelper


  it 'should show a pitch on the index page' do
    user = create(:user)
    login(user)

    visit pitches_path

    click_on 'New Pitch!'

    fill_in :pitch_title, with: 'Change The World'
    fill_in :pitch_content, with: 'global solutions with a locally sourced, cloud enabled thing'
    click_on 'Pitch it!'

    visit pitches_path
    expect(page).to have_content 'New Pitch!'
  end

end
