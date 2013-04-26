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

ActiveRecord::Schema.define(:version => 20130425151757) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "activities", :force => true do |t|
    t.string   "title",            :default => "", :null => false
    t.string   "summary",          :default => "", :null => false
    t.text     "full_description", :default => "", :null => false
    t.integer  "category_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "priority",         :default => 10, :null => false
    t.string   "image"
  end

  add_index "activities", ["category_id"], :name => "index_activities_on_category_id"

  create_table "activities_thresholds", :id => false, :force => true do |t|
    t.integer "activity_id"
    t.integer "threshold_id"
  end

  add_index "activities_thresholds", ["activity_id", "threshold_id"], :name => "index_activities_thresholds_on_activity_id_and_threshold_id"

  create_table "admin_users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.text     "description", :default => "", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.integer  "activity_id"
    t.boolean  "prayer_requested", :default => false, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "threshold_id"
    t.integer  "target_event_id"
    t.integer  "pledges_count",    :default => 0,     :null => false
  end

  add_index "events", ["activity_id"], :name => "index_events_on_activity_id"
  add_index "events", ["friend_id"], :name => "index_events_on_friend_id"
  add_index "events", ["target_event_id"], :name => "index_events_on_target_event_id"
  add_index "events", ["threshold_id"], :name => "index_events_on_threshold_id"
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "friends", :force => true do |t|
    t.string   "first_name",   :default => "", :null => false
    t.string   "last_name",    :default => "", :null => false
    t.integer  "user_id"
    t.integer  "threshold_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "email"
    t.string   "mobile"
    t.string   "image"
  end

  add_index "friends", ["threshold_id"], :name => "index_friends_on_threshold_id"
  add_index "friends", ["user_id"], :name => "index_friends_on_user_id"

  create_table "group_users", :force => true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "group_users", ["group_id", "user_id"], :name => "index_group_users_on_group_id_and_user_id"

  create_table "groups", :force => true do |t|
    t.string   "name",        :default => "", :null => false
    t.string   "description", :default => "", :null => false
    t.integer  "user_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "groups", ["user_id"], :name => "index_groups_on_user_id"

  create_table "invite_requests", :force => true do |t|
    t.integer  "user_id",                          :null => false
    t.integer  "group_id",                         :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "email"
    t.string   "sms"
    t.string   "kind",       :default => "INVITE", :null => false
  end

  add_index "invite_requests", ["group_id"], :name => "index_invite_requests_on_group_id"
  add_index "invite_requests", ["user_id"], :name => "index_invite_requests_on_user_id"

  create_table "pledges", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pledges", ["event_id"], :name => "index_pledges_on_event_id"
  add_index "pledges", ["user_id", "event_id"], :name => "index_pledges_on_user_id_and_event_id"
  add_index "pledges", ["user_id"], :name => "index_pledges_on_user_id"

  create_table "settings", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "settings", ["key"], :name => "index_settings_on_key", :unique => true

  create_table "thresholds", :force => true do |t|
    t.string   "title",      :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "first_name",             :default => "",   :null => false
    t.string   "last_name",              :default => "",   :null => false
    t.string   "mobile"
    t.string   "locale",                 :default => "en", :null => false
    t.string   "image"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
