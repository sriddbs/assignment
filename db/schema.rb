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

ActiveRecord::Schema.define(version: 2019_03_24_164159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.string "title", null: false
    t.text "plot", null: false
    t.integer "number", null: false
    t.bigint "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_episodes_on_number", unique: true
    t.index ["season_id"], name: "index_episodes_on_season_id"
    t.index ["title"], name: "index_episodes_on_title", unique: true
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.text "plot", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_movies_on_title", unique: true
  end

  create_table "purchase_line_items", force: :cascade do |t|
    t.decimal "price", precision: 8, scale: 2, null: false
    t.string "video_quality", null: false
    t.string "content_type"
    t.bigint "content_id"
    t.bigint "purchase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_type", "content_id"], name: "index_purchase_line_items_on_content_type_and_content_id"
    t.index ["purchase_id"], name: "index_purchase_line_items_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.decimal "price", precision: 8, scale: 2, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "title", null: false
    t.text "plot", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_seasons_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "episodes", "seasons"
  add_foreign_key "purchases", "users"
end
