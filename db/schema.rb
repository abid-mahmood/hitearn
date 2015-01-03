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

ActiveRecord::Schema.define(version: 20150103072732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: true do |t|
    t.string   "adv_name"
    t.float    "rate_per_click"
    t.string   "company"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "functional",     default: false
    t.string   "link"
  end

  create_table "amounts", force: true do |t|
    t.float    "fixed_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cash_outs", force: true do |t|
    t.integer  "user_id"
    t.float    "cash_out_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",       default: false
  end

  create_table "payments", force: true do |t|
    t.boolean  "status",       default: false
    t.datetime "paid_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "fixed_amount"
    t.integer  "user_id"
  end

  create_table "user_earnings", force: true do |t|
    t.integer  "user_id"
    t.integer  "adv_id"
    t.float    "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "activated_at"
    t.boolean  "activated",      default: false
    t.integer  "cash_out_id"
    t.string   "contact_number"
    t.string   "cnic"
    t.integer  "referral_num"
    t.boolean  "free",           default: false
  end

end
