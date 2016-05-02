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

ActiveRecord::Schema.define(version: 20160502093838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "coach_id"
  end

  add_index "groups", ["coach_id"], name: "index_groups_on_coach_id", using: :btree

  create_table "personal_characteristics", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "age"
    t.float    "activity_index"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.hstore   "rufe_index",     default: {}
    t.hstore   "weight_index",   default: {}
    t.integer  "coach_id"
  end

  add_index "personal_characteristics", ["coach_id"], name: "index_personal_characteristics_on_coach_id", using: :btree
  add_index "personal_characteristics", ["rufe_index"], name: "index_personal_characteristics_on_rufe_index", using: :gist
  add_index "personal_characteristics", ["user_id"], name: "index_personal_characteristics_on_user_id", using: :btree
  add_index "personal_characteristics", ["weight_index"], name: "index_personal_characteristics_on_weight_index", using: :gist

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "coach_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "position"
    t.string   "type"
  end

  add_index "users", ["coach_id"], name: "index_users_on_coach_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "groups", "users"
  add_foreign_key "groups", "users", column: "coach_id"
  add_foreign_key "personal_characteristics", "users"
  add_foreign_key "personal_characteristics", "users", column: "coach_id"
  add_foreign_key "users", "users", column: "coach_id"
end
