class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :pitch, index: true
      t.boolean :upvote
    end
    add_index "votes", ["user_id", "pitch_id"], :unique => true
  end
end
