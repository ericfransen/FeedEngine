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

ActiveRecord::Schema.define(version: 20141113001358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fitbit_goals", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "fitbit_goals", ["user_id"], name: "index_fitbit_goals_on_user_id", using: :btree

  create_table "github_goals", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commit_goal",    default: 1
    t.integer  "user_id"
    t.integer  "streak",         default: 0
    t.integer  "longest_streak", default: 0
    t.integer  "commit_count"
    t.float    "progress"
  end

  add_index "github_goals", ["user_id"], name: "index_github_goals_on_user_id", using: :btree

  create_table "oauth_accounts", force: true do |t|
    t.string  "token"
    t.string  "secret"
    t.string  "provider"
    t.integer "user_id"
    t.string  "nickname"
    t.string  "uid"
    t.string  "name"
  end

  add_index "oauth_accounts", ["provider"], name: "index_oauth_accounts_on_provider", using: :btree
  add_index "oauth_accounts", ["token"], name: "index_oauth_accounts_on_token", using: :btree
  add_index "oauth_accounts", ["user_id"], name: "index_oauth_accounts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "uid"
    t.string "provider"
    t.string "phone_number"
    t.string "twitter_pic"
    t.time   "time_to_text"
  end

end
