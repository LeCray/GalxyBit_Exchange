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

ActiveRecord::Schema.define(version: 20171023184640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "zar_balance"
    t.decimal  "btc_balance"
    t.decimal  "ltc_balance"
    t.decimal  "eth_balance"
    t.index ["client_id"], name: "index_accounts_on_client_id", using: :btree
  end

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "email"
    t.string   "password_digest"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.integer  "referral_id"
    t.boolean  "admin"
  end

  create_table "currencies", force: :cascade do |t|
    t.integer  "currency_type"
    t.float    "value"
    t.date     "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "account_id"
    t.integer  "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["account_id"], name: "index_profiles_on_account_id", using: :btree
    t.index ["client_id"], name: "index_profiles_on_client_id", using: :btree
    t.index ["transaction_id"], name: "index_profiles_on_transaction_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "transaction_type"
    t.integer  "account_id"
    t.decimal  "amount"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "transaction_number"
    t.index ["account_id"], name: "index_transactions_on_account_id", using: :btree
  end

  create_table "zar_transactions", force: :cascade do |t|
    t.string   "transaction_type"
    t.decimal  "amount"
    t.integer  "account_id"
    t.decimal  "transaction_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "status"
  end

  add_foreign_key "accounts", "clients"
  add_foreign_key "profiles", "accounts"
  add_foreign_key "profiles", "clients"
  add_foreign_key "profiles", "transactions"
  add_foreign_key "transactions", "accounts"
end
