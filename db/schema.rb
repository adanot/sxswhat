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

ActiveRecord::Schema.define(version: 20140226202320) do

  create_table "events", force: true do |t|
    t.text     "content",    limit: 255
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.string   "location"
    t.string   "age"
    t.integer  "type"
    t.time     "tstart"
    t.time     "tend"
    t.integer  "price"
    t.boolean  "drinks"
    t.string   "address"
    t.boolean  "test"
    t.string   "link"
    t.boolean  "free"
    t.boolean  "rsvp"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
  end

  add_index "events", ["slug"], name: "index_events_on_slug"

  create_table "links", force: true do |t|
    t.text     "url"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_calendars", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.string   "last_name"
    t.boolean  "privacy"
    t.boolean  "emailopt"
    t.string   "displayname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
