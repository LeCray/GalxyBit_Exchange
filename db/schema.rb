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

ActiveRecord::Schema.define(version: 20171112095254) do

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

  create_table "btc_transactions", force: :cascade do |t|
    t.string   "transaction_type"
    t.integer  "account_id"
    t.string   "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.decimal  "transaction_number"
    t.decimal  "btcBuyAmount"
    t.decimal  "btcSellAmount"
    t.decimal  "zarSpendAmount"
    t.decimal  "zarRecieveAmount"
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

  create_table "eth_transactions", force: :cascade do |t|
    t.string   "transaction_type"
    t.integer  "account_id"
    t.string   "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.decimal  "transaction_number"
    t.decimal  "ethBuyAmount"
    t.decimal  "ethSellAmount"
    t.decimal  "zarSpendAmount"
    t.decimal  "zarRecieveAmount"
  end

  create_table "ltc_transactions", force: :cascade do |t|
    t.string   "transaction_type"
    t.integer  "account_id"
    t.string   "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.decimal  "transaction_number"
    t.decimal  "ltcBuyAmount"
    t.decimal  "ltcSellAmount"
    t.decimal  "zarSpendAmount"
    t.decimal  "zarRecieveAmount"
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
end
