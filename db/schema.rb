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

ActiveRecord::Schema.define(version: 20170424024124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.integer  "id_team_a"
    t.integer  "id_team_b"
    t.integer  "score_team_a"
    t.integer  "score_team_b"
    t.integer  "id_group"
    t.datetime "battle_date"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.text    "title"
    t.text    "description"
    t.date    "date_post"
    t.integer "user_id"
    t.integer "battle_id"
    t.boolean "status"
  end

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.string  "short_name"
    t.boolean "seed"
    t.string  "status"
    t.integer "point"
    t.string  "image_file_name"
    t.string  "image_content_type"
    t.integer "image_file_size"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "range"
    t.string   "email"
    t.string   "phone"
    t.boolean  "status"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "posts", "users"
end
