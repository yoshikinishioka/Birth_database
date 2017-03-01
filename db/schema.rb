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

ActiveRecord::Schema.define(version: 20170301074500) do

  create_table "friends", force: :cascade do |t|
    t.string   "user_id"
    t.string   "fb_user_id"
    t.date     "birthday"
    t.string   "name"
    t.string   "icon"
    t.string   "friends"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "sender_id"
    t.string   "receiver_id"
    t.string   "content"
    t.string   "message_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_id"
    t.string   "fb_user_id"
    t.date     "birthday"
    t.string   "name"
    t.string   "icon"
    t.string   "friends"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "users_friends", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "friend_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_friends", ["friend_id"], name: "index_users_friends_on_friend_id"
  add_index "users_friends", ["user_id"], name: "index_users_friends_on_user_id"

end
