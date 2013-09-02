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

      expect(page.first('#pitch-score').text).to eq '0'

      click_on '+1'

      expect(page.first('h2#score').text).to eq '1'

    end

  end

end
