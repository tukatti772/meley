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

ActiveRecord::Schema.define(version: 20180227204304) do

  create_table "busianswers", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "business_id",    limit: 4
    t.text     "text",           limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_id",        limit: 4
    t.string   "user_nickname",  limit: 255
    t.string   "label",          limit: 255
    t.integer  "likes_count",    limit: 4,     default: 0
    t.text     "business_title", limit: 65535
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "text",        limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id",     limit: 4
    t.string   "label",       limit: 255
    t.integer  "likes_count", limit: 4,     default: 0
    t.text     "title",       limit: 65535
    t.text     "tag",         limit: 65535
  end

  create_table "dairies", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "text",        limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id",     limit: 4
    t.string   "label",       limit: 255
    t.integer  "likes_count", limit: 4,     default: 0
    t.string   "title",       limit: 255
    t.text     "tag",         limit: 65535
  end

  create_table "dairies_tags", force: :cascade do |t|
    t.integer "tag_id",   limit: 4
    t.integer "dairy_id", limit: 4
  end

  create_table "dairyanswers", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "dairy_id",      limit: 4
    t.text     "text",          limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id",       limit: 4
    t.string   "user_nickname", limit: 255
    t.string   "label",         limit: 255
    t.integer  "likes_count",   limit: 4,     default: 0
    t.text     "dairy_title",   limit: 65535
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "business_id",    limit: 4
    t.integer  "busianswer_id",  limit: 4
    t.integer  "dairy_id",       limit: 4
    t.integer  "dairyanswer_id", limit: 4
    t.integer  "other_id",       limit: 4
    t.integer  "otheranswer_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "otheranswers", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "other_id",      limit: 4
    t.text     "text",          limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id",       limit: 4
    t.string   "user_nickname", limit: 255
    t.string   "label",         limit: 255
    t.integer  "likes_count",   limit: 4,     default: 0
    t.text     "other_title",   limit: 65535
  end

  create_table "others", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "text",        limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id",     limit: 4
    t.string   "label",       limit: 255
    t.integer  "likes_count", limit: 4,     default: 0
    t.text     "title",       limit: 65535
    t.text     "tag",         limit: 65535
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.integer  "dairy_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "tag",        limit: 65535
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nickname",               limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.text     "comment",                limit: 65535
    t.integer  "toeic",                  limit: 4
    t.integer  "toefl",                  limit: 4
    t.integer  "ielts",                  limit: 4
    t.string   "eiken",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
