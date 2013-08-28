class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.string :content
      t.integer :score
      t.belongs_to :pitch
      t.timestamps
    end
  end
end
