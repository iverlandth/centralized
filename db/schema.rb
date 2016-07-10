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

ActiveRecord::Schema.define(version: 20160710050000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "event_id"
    t.integer  "church_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["church_id"], name: "index_blogs_on_church_id", using: :btree
    t.index ["event_id"], name: "index_blogs_on_event_id", using: :btree
    t.index ["user_id"], name: "index_blogs_on_user_id", using: :btree
  end

  create_table "churches", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.text     "mission"
    t.text     "vision"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "country"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "twitter_url"
    t.string   "facebook_url"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "event_start_at"
    t.datetime "event_end_at"
    t.text     "address"
    t.integer  "status"
    t.integer  "church_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["church_id"], name: "index_events_on_church_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "meetings", force: :cascade do |t|
    t.string   "name"
    t.string   "type_meeting"
    t.integer  "day"
    t.datetime "meeting_start_at"
    t.datetime "meeting_end_at"
    t.text     "address"
    t.integer  "status"
    t.integer  "church_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["church_id"], name: "index_meetings_on_church_id", using: :btree
    t.index ["user_id"], name: "index_meetings_on_user_id", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "cellphone"
    t.string   "telephone"
    t.text     "address"
    t.integer  "status"
    t.integer  "church_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["church_id"], name: "index_members_on_church_id", using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "petitions", force: :cascade do |t|
    t.string   "category"
    t.string   "title"
    t.text     "message"
    t.integer  "status"
    t.integer  "church_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["church_id"], name: "index_petitions_on_church_id", using: :btree
    t.index ["user_id"], name: "index_petitions_on_user_id", using: :btree
  end

  create_table "sub_events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "sub_event_start_at"
    t.datetime "sub_event_end_at"
    t.string   "place"
    t.integer  "event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["event_id"], name: "index_sub_events_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "rol"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "church_id"
    t.index ["church_id"], name: "index_users_on_church_id", using: :btree
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "blogs", "churches"
  add_foreign_key "blogs", "events"
  add_foreign_key "blogs", "users"
  add_foreign_key "events", "churches"
  add_foreign_key "events", "users"
  add_foreign_key "meetings", "churches"
  add_foreign_key "meetings", "users"
  add_foreign_key "members", "churches"
  add_foreign_key "members", "users"
  add_foreign_key "petitions", "churches"
  add_foreign_key "petitions", "users"
  add_foreign_key "sub_events", "events"
  add_foreign_key "users", "churches"
end
