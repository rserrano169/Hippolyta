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

ActiveRecord::Schema.define(version: 20150518193257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"
  enable_extension "unaccent"

  create_table "cart_products", force: true do |t|
    t.integer  "cart_id",                null: false
    t.integer  "product_id",             null: false
    t.integer  "quantity",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_products", ["cart_id"], name: "index_cart_products_on_cart_id", using: :btree
  add_index "cart_products", ["product_id"], name: "index_cart_products_on_product_id", using: :btree

  create_table "carts", force: true do |t|
    t.integer  "buyer_id"
    t.string   "session_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["buyer_id"], name: "index_carts_on_buyer_id", unique: true, using: :btree
  add_index "carts", ["session_token"], name: "index_carts_on_session_token", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name",                                          null: false
    t.decimal  "sale_price",           precision: 12, scale: 2, null: false
    t.integer  "quantity",                                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "original_price",       precision: 12, scale: 2
    t.text     "description"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "seller_id",                                     null: false
  end

  add_index "products", ["description"], name: "index_products_on_description", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["seller_id"], name: "index_products_on_seller_id", using: :btree

  create_table "queries", force: true do |t|
    t.integer  "querier_id"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token"
  end

  add_index "queries", ["querier_id"], name: "index_queries_on_querier_id", using: :btree
  add_index "queries", ["session_token"], name: "index_queries_on_session_token", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                null: false
    t.string   "password_digest",      null: false
    t.string   "session_token",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                 null: false
    t.string   "phone_number"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
