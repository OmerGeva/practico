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

ActiveRecord::Schema.define(version: 2019_12_01_124124) do

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
    t.index ["skill_id"], name: "index_challenges_on_skill_id"
  end

  create_table "check_ins", force: :cascade do |t|
    t.bigint "users_challenge_id"
    t.boolean "completed"
    t.float "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_challenge_id"], name: "index_check_ins_on_users_challenge_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_challenges", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "challenge_id"
    t.float "user_progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_users_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_users_challenges_on_user_id"
  end

  add_foreign_key "challenges", "skills"
  add_foreign_key "check_ins", "users_challenges"
  add_foreign_key "users_challenges", "challenges"
  add_foreign_key "users_challenges", "users"
end
