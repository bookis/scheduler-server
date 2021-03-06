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

ActiveRecord::Schema.define(version: 20151020044700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: true do |t|
    t.text     "subject"
    t.text     "body"
    t.string   "to"
    t.integer  "times"
    t.integer  "every_n_minutes"
    t.time     "send_first_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "emails", ["user_id"], name: "index_emails_on_user_id", using: :btree

  create_table "schedules", force: true do |t|
    t.datetime "send_at"
    t.integer  "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "uid"
    t.string   "token"
    t.time     "token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "refresh_token"
  end

  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
