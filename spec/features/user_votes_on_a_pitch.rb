require 'spec_helper'

describe 'a user votes on a pitch' do
  include LoginHelper

  describe 'when the vote is an upvote' do

    it 'should increase the score of the pitch' do

      user = create(:user)
      login(user)

      pitch = create(:pitch, {user: user})

      visit pitch_path(pitch)

      expect(page.first('#pitch-score').text).to eq '0'

      click_on '+1'

      expect(page.first('h2#score').text).to eq '1'

    end

  end

end
