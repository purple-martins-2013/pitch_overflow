# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130829183011) do

  create_table "pitches", force: true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "score",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "pitches", ["user_id"], name: "index_pitches_on_user_id"

  create_table "reactions", force: true do |t|
    t.string   "content"
    t.integer  "score",      default: 0
    t.integer  "pitch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "reactions", ["user_id"], name: "index_reactions_on_user_id"

  create_table "users", force: true do |t|
    t.string "username"
    t.string "provider"
    t.string "uid"
  end

  create_table "votes", force: true do |t|
    t.integer "user_id"
    t.integer "pitch_id"
    t.boolean "upvote"
  end

  add_index "votes", ["pitch_id"], name: "index_votes_on_pitch_id"
  add_index "votes", ["user_id", "pitch_id"], name: "index_votes_on_user_id_and_pitch_id", unique: true
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
