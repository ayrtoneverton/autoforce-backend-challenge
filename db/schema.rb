# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_30_225847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.string "reference", null: false
    t.bigint "purchase_channel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_channel_id"], name: "index_batches_on_purchase_channel_id"
    t.index ["reference"], name: "index_batches_on_reference", unique: true
  end

  create_table "delivery_services", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_delivery_services_on_name", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.string "reference", null: false
    t.text "address", null: false
    t.text "line_items", null: false
    t.float "total_value", null: false
    t.bigint "user_id", null: false
    t.bigint "status_id", null: false
    t.bigint "delivery_service_id", null: false
    t.bigint "purchase_channel_id", null: false
    t.bigint "batch_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["batch_id"], name: "index_orders_on_batch_id"
    t.index ["delivery_service_id"], name: "index_orders_on_delivery_service_id"
    t.index ["purchase_channel_id"], name: "index_orders_on_purchase_channel_id"
    t.index ["reference"], name: "index_orders_on_reference", unique: true
    t.index ["status_id"], name: "index_orders_on_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "purchase_channels", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_purchase_channels_on_name", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_statuses_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batches", "purchase_channels"
  add_foreign_key "orders", "batches"
  add_foreign_key "orders", "delivery_services"
  add_foreign_key "orders", "purchase_channels"
  add_foreign_key "orders", "statuses"
  add_foreign_key "orders", "users"
end
