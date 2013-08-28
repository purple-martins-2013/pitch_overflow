class AddDefaultValueToReactionScore < ActiveRecord::Migration
  
  def up
    change_column :reactions, :score, :integer, default: 0 
  end

  def down
    change_column :reactions, :score, :integer, default: nil 
  end

end
