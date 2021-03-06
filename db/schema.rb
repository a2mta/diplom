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

ActiveRecord::Schema.define(version: 20150614222353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achivments", force: :cascade do |t|
    t.string   "achive_content"
    t.string   "achive_type"
    t.string   "start"
    t.string   "finish"
    t.integer  "count"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "time"
    t.string   "achive_photo_file_name"
    t.string   "achive_photo_content_type"
    t.integer  "achive_photo_file_size"
    t.datetime "achive_photo_updated_at"
  end

  add_index "achivments", ["user_id", "created_at"], name: "index_achivments_on_user_id_and_created_at", using: :btree

  create_table "achivments_type", force: :cascade do |t|
    t.string   "achivment_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "microphoto_file_name"
    t.string   "microphoto_content_type"
    t.integer  "microphoto_file_size"
    t.datetime "microphoto_updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "encrypted_password"
    t.string   "salt"
    t.text     "info"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "admin"
  end

end
