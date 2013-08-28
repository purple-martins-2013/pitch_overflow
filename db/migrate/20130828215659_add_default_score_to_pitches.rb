class AddDefaultScoreToPitches < ActiveRecord::Migration
  def change
    change_table :pitches do |t|
      t.change_default :score, 0
    end
  end
end
