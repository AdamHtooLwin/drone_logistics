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

ActiveRecord::Schema.define(version: 2018_10_03_140253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "road"
    t.string "district"
    t.string "city"
    t.float "gps_latitude"
    t.float "gps_longitude"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "drones", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.float "carrying_capacity"
    t.float "price"
    t.date "acquired_date"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nav_logs", force: :cascade do |t|
    t.float "altitude"
    t.float "gps_latitude"
    t.float "gps_longitude"
    t.bigint "drone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_nav_logs_on_drone_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "completed_datetime"
    t.bigint "address_id"
    t.string "status"
    t.float "weight"
    t.bigint "customer_id"
    t.bigint "staff_id"
    t.bigint "drone_id"
    t.datetime "assigned_datetime"
    t.datetime "shipped_datetime"
    t.datetime "estimated_arrival"
    t.float "item_weight"
    t.float "length"
    t.float "breadth"
    t.float "height"
    t.float "estimated_value"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["drone_id"], name: "index_orders_on_drone_id"
    t.index ["staff_id"], name: "index_orders_on_staff_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "nav_logs", "drones"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "drones"
  add_foreign_key "orders", "staffs"
end
