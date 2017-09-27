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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170921041237) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type"

  create_table "comments", force: :cascade do |t|
    t.string   "username"
    t.text     "content"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "event_type"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fcomments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "forest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fcomments", ["forest_id"], name: "index_fcomments_on_forest_id"

  create_table "forest_admins", force: :cascade do |t|
    t.string   "content"
    t.integer  "like"
    t.integer  "dislike"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "forestdislikes", force: :cascade do |t|
    t.integer  "forest_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forestlikes", force: :cascade do |t|
    t.integer  "forest_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

=======
>>>>>>> 56a5a8f368b6cc782432e3fd2d4edebc23133d40
  create_table "forests", force: :cascade do |t|
    t.text     "content"
    t.boolean  "censored"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "markets", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "user_name"
    t.integer  "hit",        default: 0
    t.integer  "like",       default: 0
    t.integer  "dislike",    default: 0
    t.boolean  "rec",        default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "sold",       default: false
  end

  create_table "mcomments", force: :cascade do |t|
    t.string   "commenter"
    t.integer  "user_id"
    t.text     "body"
    t.integer  "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mcomments", ["market_id"], name: "index_mcomments_on_market_id"

  create_table "mdluids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mdluids", ["market_id"], name: "index_mdluids_on_market_id"

  create_table "mluids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mluids", ["market_id"], name: "index_mluids_on_market_id"

<<<<<<< HEAD
  create_table "partycomments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.integer  "partypost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

=======
>>>>>>> 56a5a8f368b6cc782432e3fd2d4edebc23133d40
  create_table "partyjoins", force: :cascade do |t|
    t.integer  "partypost_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partylikes", force: :cascade do |t|
    t.integer  "partypost_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partyposts", force: :cascade do |t|
    t.string   "article"
    t.integer  "user_id"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pcomments", force: :cascade do |t|
    t.string   "commenter"
    t.integer  "user_id"
    t.text     "body"
    t.integer  "pointless_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pcomments", ["pointless_id"], name: "index_pcomments_on_pointless_id"

  create_table "pdluids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pointless_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pdluids", ["pointless_id"], name: "index_pdluids_on_pointless_id"

  create_table "pluids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pointless_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pluids", ["pointless_id"], name: "index_pluids_on_pointless_id"

  create_table "pointlesses", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "user_name"
    t.integer  "hit",        default: 0
    t.integer  "like",       default: 0
    t.integer  "dislike",    default: 0
    t.boolean  "rec",        default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "username"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preports", force: :cascade do |t|
    t.string   "user_id"
    t.text     "why"
    t.string   "plink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "email"
    t.string   "bname"
    t.integer  "tier",             default: 10
    t.boolean  "create_name",      default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
