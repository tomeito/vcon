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

ActiveRecord::Schema.define(version: 20190430055912) do

  create_table "entry_users", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.text "comments"
    t.string "twitter_url"
    t.string "youtube_channel"
    t.string "other_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_Mr", default: false, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.integer "entry_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_top_image"
    t.index ["entry_user_id"], name: "index_images_on_entry_user_id"
  end

  create_table "vote_users", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "image_url"
    t.datetime "voted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "vote_user_id"
    t.integer "entry_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_Mr"
    t.index ["entry_user_id"], name: "index_votes_on_entry_user_id"
    t.index ["vote_user_id"], name: "index_votes_on_vote_user_id"
  end

end
