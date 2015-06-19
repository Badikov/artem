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

ActiveRecord::Schema.define(version: 20150618144857) do

  create_table "ads", force: :cascade do |t|
    t.string   "phone"
    t.integer  "price",      default: 0,     null: false
    t.string   "location"
    t.integer  "marka_id"
    t.integer  "model_id"
    t.integer  "release_id"
    t.integer  "gearbox_id"
    t.integer  "steer_id"
    t.integer  "state_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "md5"
    t.boolean  "obsolete",   default: false, null: false
    t.integer  "region_id"
  end

  add_index "ads", ["created_at", "obsolete"], name: "index_ads_on_created_at_and_obsolete"
  add_index "ads", ["gearbox_id"], name: "index_ads_on_gearbox_id"
  add_index "ads", ["location"], name: "index_ads_on_location"
  add_index "ads", ["marka_id"], name: "index_ads_on_marka_id"
  add_index "ads", ["model_id"], name: "index_ads_on_model_id"
  add_index "ads", ["obsolete"], name: "index_ads_on_obsolete"
  add_index "ads", ["phone"], name: "index_ads_on_phone"
  add_index "ads", ["price"], name: "index_ads_on_price"
  add_index "ads", ["release_id"], name: "index_ads_on_release_id"
  add_index "ads", ["state_id"], name: "index_ads_on_state_id"
  add_index "ads", ["steer_id"], name: "index_ads_on_steer_id"

  create_table "black_lists", force: :cascade do |t|
    t.string   "phone",      null: false
    t.string   "coment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "black_lists", ["phone"], name: "index_black_lists_on_phone", unique: true

  create_table "bodies", force: :cascade do |t|
    t.string   "typ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "capacities", force: :cascade do |t|
    t.string   "volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drives", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "droms", force: :cascade do |t|
    t.string   "phone",                      null: false
    t.string   "price",      default: "0",   null: false
    t.string   "location"
    t.string   "md5"
    t.boolean  "obsolete",   default: false, null: false
    t.integer  "region_id",                  null: false
    t.integer  "marka_id"
    t.integer  "model_id"
    t.integer  "release_id"
    t.integer  "gearbox_id"
    t.integer  "steer_id"
    t.integer  "state_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "droms", ["created_at", "obsolete"], name: "index_droms_on_created_at_and_obsolete"
  add_index "droms", ["gearbox_id"], name: "index_droms_on_gearbox_id"
  add_index "droms", ["location"], name: "index_droms_on_location"
  add_index "droms", ["marka_id"], name: "index_droms_on_marka_id"
  add_index "droms", ["model_id"], name: "index_droms_on_model_id"
  add_index "droms", ["obsolete"], name: "index_droms_on_obsolete"
  add_index "droms", ["phone"], name: "index_droms_on_phone"
  add_index "droms", ["price"], name: "index_droms_on_price"
  add_index "droms", ["region_id"], name: "index_droms_on_region_id"
  add_index "droms", ["release_id"], name: "index_droms_on_release_id"
  add_index "droms", ["state_id"], name: "index_droms_on_state_id"
  add_index "droms", ["steer_id"], name: "index_droms_on_steer_id"

  create_table "engines", force: :cascade do |t|
    t.string   "typ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gearboxes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "region_id",  null: false
  end

  create_table "markas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name2"
  end

  create_table "models", force: :cascade do |t|
    t.string   "name"
    t.integer  "marka_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name2"
  end

  add_index "models", ["marka_id"], name: "index_models_on_marka_id"

  create_table "odometers", force: :cascade do |t|
    t.string   "kilometer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "releases", force: :cascade do |t|
    t.string   "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steers", force: :cascade do |t|
    t.string   "typ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",                              null: false
    t.string   "name",                default: "",   null: false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "imei",                default: "",   null: false
    t.string   "phone_number",                       null: false
    t.boolean  "active",              default: true
    t.integer  "login_count",         default: 0,    null: false
    t.integer  "failed_login_count",  default: 0,    null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "single_access_token",                null: false
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true

end
