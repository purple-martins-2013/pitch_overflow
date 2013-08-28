class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :title
      t.string :content
      t.integer :score
      t.timestamps
    end
  end
end
