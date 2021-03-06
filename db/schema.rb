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

ActiveRecord::Schema.define(version: 2019_01_23_004229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "deeds", force: :cascade do |t|
    t.string "position"
    t.string "sign"
    t.string "punishment"
    t.string "status"
    t.integer "detriment"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deputy_id"
    t.bigint "region_id"
    t.string "links", array: true
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_deeds_on_admin_id"
    t.index ["deputy_id"], name: "index_deeds_on_deputy_id"
    t.index ["region_id"], name: "index_deeds_on_region_id"
  end

  create_table "deputies", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "patronymic"
    t.string "current_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "views", default: 0
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_deputies_on_admin_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "region_code"
    t.string "region_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "deeds", "admins"
  add_foreign_key "deeds", "deputies"
  add_foreign_key "deeds", "regions"
  add_foreign_key "deputies", "admins"
end
