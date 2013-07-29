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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130729152957) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "jbc_orders", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.text     "addres"
    t.string   "country"
    t.string   "city"
    t.string   "order_date"
    t.string   "updated_by"
    t.integer  "number_of_copies"
    t.string   "state"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.float    "amount"
  end

  create_table "options", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "city_id"
  end

  create_table "shipper_export_details", :force => true do |t|
    t.string   "sector"
    t.string   "country"
    t.string   "mode"
    t.string   "f_dest"
    t.string   "line"
    t.string   "c_and_f"
    t.integer  "shipper_id"
    t.string   "cargo"
    t.string   "cont_size"
    t.string   "cargo_desc"
    t.float    "gr_wt"
    t.integer  "quantity"
    t.string   "units"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shippers", :force => true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.integer  "zip_code"
    t.string   "contact_person"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
