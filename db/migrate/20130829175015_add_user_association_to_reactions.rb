class AddUserAssociationToReactions < ActiveRecord::Migration
  def change
    add_column :reactions, :user_id, :integer
    add_index :reactions, :user_id
  end
end
