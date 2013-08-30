class RemoveScoreFromPitches < ActiveRecord::Migration
  def change
    remove_column :pitches, :score, :integer
  end
end
