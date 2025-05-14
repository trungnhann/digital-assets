# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_14_102539) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "assets", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.string "title", null: false
    t.text "description"
    t.string "file_url", null: false
    t.decimal "price", precision: 10, scale: 1, null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_assets_on_creator_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "asset_id", null: false
    t.decimal "price", precision: 10, scale: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_order_items_on_asset_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.decimal "total_amount", precision: 10, scale: 1, null: false
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "full_name", limit: 50, null: false
    t.string "password_digest", null: false
    t.string "role", default: "customer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
