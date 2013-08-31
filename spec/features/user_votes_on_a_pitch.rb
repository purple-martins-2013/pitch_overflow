require 'spec_helper'

describe 'a user votes on a pitch' do

  describe 'when the vote is an upvote' do

    it 'should increase the score of the pitch' do

      user = create(:user)
      # REFACTOR: is this the only way i can set session
      # variables when using capybara?
      page.set_rack_session(user_id: user.id)
      pitch = create(:pitch, {user: user})

      visit pitch_path(pitch)

      expect(page.first('#pitch-score').text).to eq 'Score: 0'

      click_on 'Upvote'

      expect(page.first('#pitch-score').text).to eq 'Score: 1'

    end

  end

end
