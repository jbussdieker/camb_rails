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

ActiveRecord::Schema.define(:version => 20130602020852) do

  create_table "load_test_results", :force => true do |t|
    t.integer  "load_test_id"
    t.integer  "timestamp",    :limit => 8
    t.integer  "probe_id"
    t.float    "total_time"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "load_tests", :force => true do |t|
    t.string   "host"
    t.integer  "port",       :default => 80
    t.integer  "duration",   :default => 60
    t.float    "interval",   :default => 1.0
    t.integer  "status",     :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "probes", :force => true do |t|
    t.string   "location"
    t.string   "host"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
