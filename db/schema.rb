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

ActiveRecord::Schema.define(version: 20131110155001) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "coupons", force: true do |t|
    t.integer  "user_id"
    t.integer  "promotion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked"
  end

  add_index "coupons", ["promotion_id"], name: "index_coupons_on_promotion_id", using: :btree
  add_index "coupons", ["user_id"], name: "index_coupons_on_user_id", using: :btree

  create_table "establishments", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "description",            limit: 420
    t.decimal  "latitude",                           precision: 25, scale: 10
    t.decimal  "longitude",                          precision: 25, scale: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "email",                                                        default: "", null: false
    t.string   "encrypted_password",                                           default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "likes_count",                                                  default: 0,  null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.boolean  "daily_point_limit"
    t.string   "fidelity_card"
    t.integer  "share_points"
  end

  add_index "establishments", ["email"], name: "index_establishments_on_email", unique: true, using: :btree
  add_index "establishments", ["reset_password_token"], name: "index_establishments_on_reset_password_token", unique: true, using: :btree

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "establishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["establishment_id"], name: "index_likes_on_establishment_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "news", force: true do |t|
    t.string   "news",             limit: 150
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "establishment_id"
  end

  add_index "news", ["establishment_id"], name: "index_news_on_establishment_id", using: :btree

  create_table "points", force: true do |t|
    t.integer  "user_id"
    t.integer  "establishment_id"
    t.string   "point_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coupon_id"
  end

  add_index "points", ["coupon_id"], name: "index_points_on_coupon_id", using: :btree
  add_index "points", ["establishment_id"], name: "index_points_on_establishment_id", using: :btree
  add_index "points", ["user_id"], name: "index_points_on_user_id", using: :btree

  create_table "promotions", force: true do |t|
    t.string   "description"
    t.integer  "points"
    t.datetime "valid_until"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "establishment_id"
    t.integer  "share_points"
  end

  add_index "promotions", ["establishment_id"], name: "index_promotions_on_establishment_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
