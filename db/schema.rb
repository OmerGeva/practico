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

ActiveRecord::Schema.define(version: 2019_12_04_085541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.bigint "skill_id"
    t.integer "milestone"
    t.date "starting_date"
    t.string "first_place"
    t.string "last_place"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_type"
    t.string "count_type"
    t.string "validation_type"
    t.boolean "completed", default: false
    t.index ["skill_id"], name: "index_challenges_on_skill_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "challenge_id"
    t.index ["challenge_id"], name: "index_chat_rooms_on_challenge_id"
  end

  create_table "check_ins", force: :cascade do |t|
    t.bigint "users_challenge_id"
    t.boolean "completed"
    t.float "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["users_challenge_id"], name: "index_check_ins_on_users_challenge_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_challenge_id"
    t.bigint "user_id"
    t.string "color"
    t.index ["user_id"], name: "index_events_on_user_id"
    t.index ["users_challenge_id"], name: "index_events_on_users_challenge_id"
  end

  create_table "friendships", id: :serial, force: :cascade do |t|
    t.string "friendable_type"
    t.integer "friendable_id"
    t.integer "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "blocker_id"
    t.integer "status"
    t.index ["friendable_id", "friend_id"], name: "index_friendships_on_friendable_id_and_friend_id", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "chat_room_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_challenges", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "challenge_id"
    t.float "user_progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted"
    t.boolean "unread", default: false
    t.index ["challenge_id"], name: "index_users_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_users_challenges_on_user_id"
  end

  create_table "wins", force: :cascade do |t|
    t.string "challenge"
    t.string "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "date"
  end

  add_foreign_key "challenges", "skills"
  add_foreign_key "chat_rooms", "challenges"
  add_foreign_key "check_ins", "users_challenges"
  add_foreign_key "events", "users"
  add_foreign_key "events", "users_challenges"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "users_challenges", "challenges"
  add_foreign_key "users_challenges", "users"
end
