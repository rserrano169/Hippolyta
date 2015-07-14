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

ActiveRecord::Schema.define(version: 20150714180135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"
  enable_extension "unaccent"

  create_table "addresses", force: true do |t|
    t.string   "name",       null: false
    t.string   "street",     null: false
    t.string   "apt"
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.string   "zip",        null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "cart_products", force: true do |t|
    t.integer  "cart_id",                null: false
    t.integer  "product_id",             null: false
    t.integer  "quantity",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_products", ["cart_id", "product_id"], name: "index_cart_products_on_cart_id_and_product_id", unique: true, using: :btree
  add_index "cart_products", ["product_id", "cart_id"], name: "index_cart_products_on_product_id_and_cart_id", unique: true, using: :btree

  create_table "carts", force: true do |t|
    t.integer  "buyer_id"
    t.string   "session_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["buyer_id"], name: "index_carts_on_buyer_id", unique: true, using: :btree
  add_index "carts", ["session_token"], name: "index_carts_on_session_token", unique: true, using: :btree

  create_table "product_tags", force: true do |t|
    t.integer  "product_id", null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_tags", ["product_id", "tag_id"], name: "index_product_tags_on_product_id_and_tag_id", unique: true, using: :btree
  add_index "product_tags", ["tag_id", "product_id"], name: "index_product_tags_on_tag_id_and_product_id", unique: true, using: :btree

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
  add_index "products", ["name"], name: "index_products_on_name", unique: true, using: :btree
  add_index "products", ["seller_id"], name: "index_products_on_seller_id", using: :btree

  create_table "purchases", force: true do |t|
    t.integer  "buyer_id",   null: false
    t.integer  "product_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["buyer_id"], name: "index_purchases_on_buyer_id", using: :btree
  add_index "purchases", ["product_id"], name: "index_purchases_on_product_id", using: :btree

  create_table "queries", force: true do |t|
    t.integer  "querier_id"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token", null: false
  end

  add_index "queries", ["querier_id"], name: "index_queries_on_querier_id", using: :btree
  add_index "queries", ["session_token"], name: "index_queries_on_session_token", using: :btree

  create_table "reviews", force: true do |t|
    t.text     "text",        null: false
    t.integer  "rating",      null: false
    t.integer  "reviewer_id", null: false
    t.integer  "product_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id", using: :btree
  add_index "reviews", ["reviewer_id", "product_id"], name: "index_reviews_on_reviewer_id_and_product_id", unique: true, using: :btree
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                       null: false
    t.string   "password_digest",             null: false
    t.string   "session_token",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                        null: false
    t.string   "phone_number"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "stripe_id"
    t.string   "stripe_default_card_id"
    t.integer  "current_shipping_address_id"
    t.integer  "default_shipping_address_id"
  end

  add_index "users", ["current_shipping_address_id"], name: "index_users_on_current_shipping_address_id", using: :btree
  add_index "users", ["default_shipping_address_id"], name: "index_users_on_default_shipping_address_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["stripe_default_card_id"], name: "index_users_on_stripe_default_card_id", unique: true, using: :btree
  add_index "users", ["stripe_id"], name: "index_users_on_stripe_id", unique: true, using: :btree

end
