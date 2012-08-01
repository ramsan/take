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

ActiveRecord::Schema.define(:version => 20120801071820) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "header_file_name"
    t.string   "header_content_type"
    t.integer  "header_file_size"
    t.datetime "header_updated_at"
  end

  create_table "categories_memories", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "memory_id"
  end

  add_index "categories_memories", ["category_id", "memory_id"], :name => "index_categories_memories_on_category_id_and_memory_id", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "memory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followings", :force => true do |t|
    t.integer "followee_id"
    t.integer "follower_id"
  end

  add_index "followings", ["followee_id", "follower_id"], :name => "index_followings_on_followee_id_and_follower_id", :unique => true

  create_table "images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "memory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "google_thumb"
    t.string   "google_main"
    t.text     "caption"
    t.integer  "user_id"
    t.string   "google_page_url"
    t.string   "external_url"
  end

  create_table "invitations", :force => true do |t|
    t.string   "fb_user"
    t.string   "fb_friend"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "host_user_id"
    t.boolean  "fb_processed_relationship", :default => false
  end

  add_index "invitations", ["fb_friend"], :name => "index_invitations_on_fb_friend"
  add_index "invitations", ["fb_user"], :name => "index_invitations_on_fb_user"

  create_table "memories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "views",                                                             :default => 0
    t.integer  "decade",                 :limit => 1
    t.date     "date_of_memory"
    t.boolean  "is_anonymous",                                                      :default => false
    t.integer  "related_memories_count",                                            :default => 0
    t.string   "year"
    t.string   "tags"
    t.string   "sale_link"
    t.decimal  "sale_price",                          :precision => 8, :scale => 2
    t.integer  "images_count",                                                      :default => 0
    t.boolean  "suspended",                                                         :default => false
  end

  create_table "memories_users", :id => false, :force => true do |t|
    t.integer "memory_id"
    t.integer "user_id"
  end

  add_index "memories_users", ["memory_id", "user_id"], :name => "index_memories_users_on_memory_id_and_user_id", :unique => true

  create_table "rams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "uname"
    t.string   "uemail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "showdowns", :force => true do |t|
    t.string   "question"
    t.string   "memory_1"
    t.string   "memory_2"
    t.string   "memory_3"
    t.string   "memory_4"
    t.string   "memory_5"
    t.integer  "user_id"
    t.boolean  "approved"
    t.integer  "approved_by"
    t.date     "approved_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_m1_file_name"
    t.string   "image_m1_content_type"
    t.integer  "image_m1_file_size"
    t.datetime "image_m1_updated_at"
    t.string   "image_m2_file_name"
    t.string   "image_m2_content_type"
    t.integer  "image_m2_file_size"
    t.datetime "image_m2_updated_at"
    t.string   "image_m3_file_name"
    t.string   "image_m3_content_type"
    t.integer  "image_m3_file_size"
    t.datetime "image_m3_updated_at"
    t.string   "image_m4_file_name"
    t.string   "image_m4_content_type"
    t.integer  "image_m4_file_size"
    t.datetime "image_m4_updated_at"
    t.string   "image_m5_file_name"
    t.string   "image_m5_content_type"
    t.integer  "image_m5_file_size"
    t.datetime "image_m5_updated_at"
    t.string   "image_1_google_thumb"
    t.string   "image_1_google_main"
    t.string   "image_1_google_page_url"
    t.string   "image_2_google_thumb"
    t.string   "image_2_google_main"
    t.string   "image_2_google_page_url"
    t.string   "image_3_google_thumb"
    t.string   "image_3_google_main"
    t.string   "image_3_google_page_url"
    t.string   "image_4_google_thumb"
    t.string   "image_4_google_main"
    t.string   "image_4_google_page_url"
    t.string   "image_5_google_thumb"
    t.string   "image_5_google_main"
    t.string   "image_5_google_page_url"
    t.integer  "category_id"
    t.integer  "decade"
    t.integer  "votes_count",             :default => 0
    t.integer  "memory_1_votes_count",    :default => 0
    t.integer  "memory_2_votes_count",    :default => 0
    t.integer  "memory_3_votes_count",    :default => 0
    t.integer  "memory_4_votes_count",    :default => 0
    t.integer  "memory_5_votes_count",    :default => 0
  end

  add_index "showdowns", ["image_1_google_main"], :name => "index_showdowns_on_image_1_google_main"
  add_index "showdowns", ["image_1_google_page_url"], :name => "index_showdowns_on_image_1_google_page_url"
  add_index "showdowns", ["image_1_google_thumb"], :name => "index_showdowns_on_image_1_google_thumb"
  add_index "showdowns", ["image_2_google_main"], :name => "index_showdowns_on_image_2_google_main"
  add_index "showdowns", ["image_2_google_page_url"], :name => "index_showdowns_on_image_2_google_page_url"
  add_index "showdowns", ["image_2_google_thumb"], :name => "index_showdowns_on_image_2_google_thumb"
  add_index "showdowns", ["image_3_google_main"], :name => "index_showdowns_on_image_3_google_main"
  add_index "showdowns", ["image_3_google_page_url"], :name => "index_showdowns_on_image_3_google_page_url"
  add_index "showdowns", ["image_3_google_thumb"], :name => "index_showdowns_on_image_3_google_thumb"
  add_index "showdowns", ["image_4_google_main"], :name => "index_showdowns_on_image_4_google_main"
  add_index "showdowns", ["image_4_google_page_url"], :name => "index_showdowns_on_image_4_google_page_url"
  add_index "showdowns", ["image_4_google_thumb"], :name => "index_showdowns_on_image_4_google_thumb"
  add_index "showdowns", ["image_5_google_main"], :name => "index_showdowns_on_image_5_google_main"
  add_index "showdowns", ["image_5_google_page_url"], :name => "index_showdowns_on_image_5_google_page_url"
  add_index "showdowns", ["image_5_google_thumb"], :name => "index_showdowns_on_image_5_google_thumb"
  add_index "showdowns", ["memory_1_votes_count"], :name => "index_showdowns_on_memory_1_votes_count"
  add_index "showdowns", ["memory_2_votes_count"], :name => "index_showdowns_on_memory_2_votes_count"
  add_index "showdowns", ["memory_3_votes_count"], :name => "index_showdowns_on_memory_3_votes_count"
  add_index "showdowns", ["memory_4_votes_count"], :name => "index_showdowns_on_memory_4_votes_count"
  add_index "showdowns", ["memory_5_votes_count"], :name => "index_showdowns_on_memory_5_votes_count"
  add_index "showdowns", ["question"], :name => "index_showdowns_on_question"

  create_table "sses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                     :default => "",    :null => false
    t.string   "encrypted_password",         :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                             :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "haslocalpw",                                :default => true,  :null => false
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "birth_year"
    t.string   "zip_code"
    t.string   "gender"
    t.text     "about_me"
    t.string   "fb_auth_token"
    t.string   "fb_picture"
    t.integer  "notification_preferences",                  :default => 15
    t.integer  "system_preferences",                        :default => 0
    t.string   "fb_identifier"
    t.string   "avatar"
    t.boolean  "admin",                                     :default => false
    t.integer  "votes_count",                               :default => 0
    t.boolean  "banned",                                    :default => false
    t.boolean  "comment_preferences",                       :default => false
    t.integer  "memories_count",                            :default => 0
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visits", :force => true do |t|
    t.string   "email"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "showdown_id"
    t.integer  "user_id"
    t.boolean  "memory_1",    :default => false
    t.boolean  "memory_2",    :default => false
    t.boolean  "memory_3",    :default => false
    t.boolean  "memory_4",    :default => false
    t.boolean  "memory_5",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["showdown_id"], :name => "index_votes_on_showdown_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

  create_table "you_tube_videos", :force => true do |t|
    t.string   "video_id"
    t.integer  "user_id"
    t.integer  "memory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
