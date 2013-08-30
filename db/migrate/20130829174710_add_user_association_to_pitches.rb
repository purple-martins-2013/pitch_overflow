class AddUserAssociationToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :user_id, :integer
    add_index :pitches, :user_id
  end
end
