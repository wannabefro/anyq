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

ActiveRecord::Schema.define(version: 20131212012605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anonymous_users", force: true do |t|
    t.string   "ip_address", null: false
    t.string   "username",   null: false
    t.string   "token",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "body",                           null: false
    t.integer  "anonymous_user_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",              default: ""
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "question_id",       null: false
    t.integer  "anonymous_user_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
