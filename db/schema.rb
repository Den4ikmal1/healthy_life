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

ActiveRecord::Schema.define(version: 20160611205134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "attachments", force: :cascade do |t|
    t.integer  "attachmentable_id"
    t.integer  "attachmentable_type"
    t.string   "file"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "attachments", ["attachmentable_id", "attachmentable_type"], name: "index_attachments_on_attachmentable_id_and_attachmentable_type", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "rule"
  end

  create_table "exercises_trainings", id: false, force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "training_id"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "coach_id"
    t.string   "title"
    t.date     "data_start"
    t.date     "data_finish"
    t.string   "days"
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

  create_table "process_trainings", force: :cascade do |t|
    t.integer  "ration_id"
    t.integer  "exercise_id"
    t.integer  "count"
    t.float    "weight"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "emulcifying_value"
    t.float    "protein"
    t.float    "carbohydrates"
    t.float    "fats"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "portion"
  end

  create_table "products_rations", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "ration_id"
  end

  add_index "products_rations", ["product_id"], name: "index_products_rations_on_product_id", using: :btree
  add_index "products_rations", ["ration_id"], name: "index_products_rations_on_ration_id", using: :btree

  create_table "rations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "morning",     default: [],              array: true
    t.integer  "afternoon",   default: [],              array: true
    t.integer  "lunch",       default: [],              array: true
    t.integer  "evening",     default: [],              array: true
    t.integer  "new_ration",  default: [],              array: true
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "group_id"
    t.boolean  "visit"
    t.date     "date_employment"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.integer  "user_ids",        default: [],              array: true
  end

  create_table "trainings", force: :cascade do |t|
    t.integer  "number"
    t.string   "name"
    t.string   "appointment"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.hstore   "exercise_param",        default: {}
    t.hstore   "exercise_param_f",      default: {}
    t.hstore   "exercise_param_s",      default: {}
    t.hstore   "exercise_param_t",      default: {}
    t.hstore   "exercise_param_fr",     default: {}
    t.hstore   "exercise_param_fv",     default: {}
    t.hstore   "exercise_param_sx",     default: {}
    t.hstore   "exercise_param_sv",     default: {}
    t.string   "notice"
    t.hstore   "exercise_param_cardio", default: {}
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "coach_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "position"
    t.string   "type"
    t.integer  "group_id"
    t.integer  "ration_id"
    t.integer  "training_id"
  end

  add_index "users", ["coach_id"], name: "index_users_on_coach_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["ration_id"], name: "index_users_on_ration_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["training_id"], name: "index_users_on_training_id", using: :btree

  add_foreign_key "users", "users", column: "coach_id"
end
