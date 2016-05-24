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

ActiveRecord::Schema.define(version: 20160522080922) do

  create_table "prices", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_id"
    t.integer  "store_id"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prices", ["product_id"], name: "index_prices_on_product_id"
  add_index "prices", ["store_id"], name: "index_prices_on_store_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "barcode"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.text     "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
