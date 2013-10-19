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

ActiveRecord::Schema.define(:version => 20131019155230) do

  create_table "booking_orders", :force => true do |t|
    t.string   "business_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "bookings", :force => true do |t|
    t.string   "business_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "booking_order_id"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "email_tables", :force => true do |t|
    t.integer  "emailer_id"
    t.string   "left"
    t.string   "right"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "emailer_horizontals", :force => true do |t|
    t.integer  "emailer_id"
    t.string   "top"
    t.string   "bottom"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "emailer_horizontals", ["emailer_id"], :name => "index_emailer_horizontals_on_emailer_id"

  create_table "emailers", :force => true do |t|
    t.string   "name"
    t.integer  "stage"
    t.text     "subject"
    t.string   "cc"
    t.string   "bcc"
    t.text     "header"
    t.text     "body"
    t.text     "footer"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "trigger_filed"
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

  create_table "magic_attribute_relationships", :force => true do |t|
    t.integer "magic_attribute_id"
    t.integer "owner_id"
    t.string  "owner_type"
  end

  create_table "magic_attributes", :force => true do |t|
    t.integer  "magic_column_id"
    t.integer  "magic_option_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magic_column_relationships", :force => true do |t|
    t.integer  "magic_column_id"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magic_columns", :force => true do |t|
    t.string   "name"
    t.string   "pretty_name"
    t.string   "datatype",      :default => "string"
    t.string   "default"
    t.boolean  "is_required",   :default => false
    t.boolean  "include_blank", :default => false
    t.boolean  "allow_other",   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magic_options", :force => true do |t|
    t.integer  "magic_column_id"
    t.string   "value"
    t.string   "synonym"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "city_id"
  end

  create_table "reports", :force => true do |t|
    t.string   "create_user"
    t.string   "company_code"
    t.string   "branch_code"
    t.string   "location_code"
    t.string   "location_name"
    t.string   "mis_job_close_status"
    t.string   "segment_code"
    t.string   "segment_name"
    t.string   "job_no"
    t.string   "subjob_no"
    t.string   "create_date"
    t.string   "job_date"
    t.string   "job_month"
    t.string   "is_etd_confirmed"
    t.string   "etd"
    t.string   "eta"
    t.string   "atd"
    t.string   "ata"
    t.string   "connection_etd"
    t.string   "connection_eta"
    t.string   "connection_atd"
    t.string   "is_eta_confirmed"
    t.string   "sea_air"
    t.string   "mawb_obl_no"
    t.string   "mawb_obl_date"
    t.string   "is_co_load"
    t.string   "service_code"
    t.string   "job_completed_status"
    t.string   "date_of_mis_closure"
    t.string   "job_agent_name"
    t.string   "origin_agent_name"
    t.string   "fdc_agent_name"
    t.string   "agent_name"
    t.string   "carrier_code"
    t.string   "carrier_name"
    t.string   "vessel_name"
    t.string   "flight_no"
    t.string   "flight_date"
    t.string   "co_loader_name"
    t.string   "hawb_hbl_no"
    t.string   "hawb_hbl_date"
    t.string   "import_clearance_date"
    t.string   "tos_code"
    t.string   "door_delivery"
    t.string   "personal_effect"
    t.string   "uc_no"
    t.string   "imo_un_no"
    t.string   "imo_code"
    t.string   "transporter_name"
    t.string   "do_no"
    t.string   "do_date"
    t.string   "do_issued_by"
    t.string   "bl_released_user"
    t.string   "bl_received_date"
    t.string   "trade_code"
    t.string   "origin_country_name"
    t.string   "origin_sector_name"
    t.string   "origin_port"
    t.string   "origin_port_name"
    t.string   "pol_country_name"
    t.string   "pol"
    t.string   "pol_port_name"
    t.string   "pod"
    t.string   "pod_country_name"
    t.string   "pod_port_name"
    t.string   "fdc_country_name"
    t.string   "fdc_region_name"
    t.string   "fdc"
    t.string   "fdc_port_name"
    t.string   "house_pp_cc"
    t.string   "who_routed"
    t.string   "is_co_loader_shipment"
    t.string   "project_code"
    t.string   "customs_cleared_by_us"
    t.string   "clearance_note"
    t.string   "shipper_name"
    t.string   "shipper_address"
    t.string   "consignee_name"
    t.string   "consignee_address"
    t.string   "forwarder_name"
    t.string   "forwarder_address"
    t.string   "notify_name"
    t.string   "notify_address"
    t.string   "customer_group_code"
    t.string   "customer_name"
    t.string   "industry_name"
    t.string   "container_no"
    t.string   "chargeable_weight"
    t.string   "gross_weight"
    t.string   "cbm"
    t.string   "teu"
    t.string   "no_of_pkgs"
    t.string   "cfs_name"
    t.string   "job_sales_location"
    t.string   "salesman_name"
    t.string   "routed_by_agent_name"
    t.string   "origin_booking_no"
    t.string   "origin_booking_location"
    t.string   "origin_booking_person"
    t.string   "fdc_booking_no"
    t.string   "fdc_booking_location"
    t.string   "fdc_booking_person"
    t.string   "subjob_status"
    t.string   "frt_revenue"
    t.string   "rebate_revenue"
    t.string   "storage_revenue"
    t.string   "other_revenue"
    t.string   "frt_cost"
    t.string   "rebate_cost"
    t.string   "other_cost"
    t.string   "neutral"
    t.string   "net"
    t.string   "transhipment_net"
    t.string   "out_gate_time_delivery_date"
    t.string   "date_of_job_completed"
    t.string   "bill_of_entry"
    t.string   "decleration_no"
    t.string   "boe_date"
    t.string   "number_of_grid"
    t.string   "cost_center_code"
    t.string   "oa_number"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
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
