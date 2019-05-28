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

ActiveRecord::Schema.define(version: 2019_05_27_224524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "student_friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_friend_id"], name: "index_friends_on_student_friend_id"
    t.index ["student_id", "student_friend_id"], name: "index_friends_on_student_id_and_student_friend_id", unique: true
    t.index ["student_id"], name: "index_friends_on_student_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "given_name"
    t.string "last_name"
    t.string "rut"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "list_number"
    t.boolean "attendance"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "link_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_votes_on_link_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "friends", "students"
  add_foreign_key "friends", "students", column: "student_friend_id"
  add_foreign_key "votes", "links"
  add_foreign_key "votes", "users"
end
