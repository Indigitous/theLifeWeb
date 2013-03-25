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

ActiveRecord::Schema.define(:version => 20130322074546) do

  create_table "activities", :force => true do |t|
    t.string   "title",            :default => "", :null => false
    t.string   "summary",          :default => "", :null => false
    t.text     "full_description", :default => "", :null => false
    t.integer  "category_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "activities", ["category_id"], :name => "index_activities_on_category_id"

  create_table "activities_thresholds", :id => false, :force => true do |t|
    t.integer "activity_id"
    t.integer "threshold_id"
  end

  add_index "activities_thresholds", ["activity_id", "threshold_id"], :name => "index_activities_thresholds_on_activity_id_and_threshold_id"

  create_table "categories", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.text     "description", :default => "", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "thresholds", :force => true do |t|
    t.string   "title",      :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "friends", :force => true do |t|
    t.string   "first_name", :default => "", :null => false
    t.string   "last_name",  :default => "", :null => false
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "friends", ["user_id"], :name => "index_friends_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
