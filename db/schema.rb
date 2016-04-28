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

ActiveRecord::Schema.define(version: 20160428201311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "book_translations", force: :cascade do |t|
    t.integer  "book_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
  end

  add_index "book_translations", ["book_id"], name: "index_book_translations_on_book_id", using: :btree
  add_index "book_translations", ["locale"], name: "index_book_translations_on_locale", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "author",     null: false
    t.string   "image_uid",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapter_translations", force: :cascade do |t|
    t.integer  "chapter_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  add_index "chapter_translations", ["chapter_id"], name: "index_chapter_translations_on_chapter_id", using: :btree
  add_index "chapter_translations", ["locale"], name: "index_chapter_translations_on_locale", using: :btree

  create_table "chapters", force: :cascade do |t|
    t.integer  "number",     null: false
    t.integer  "book_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "chapters", ["book_id"], name: "index_chapters_on_book_id", using: :btree

  create_table "media", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "type",          null: false
    t.string   "thumbnail_uid", null: false
    t.json     "sti_store",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "description1"
    t.text     "description2"
    t.integer  "chapter_id",    null: false
  end

  add_index "media", ["chapter_id"], name: "index_media_on_chapter_id", using: :btree

  create_table "medium_translations", force: :cascade do |t|
    t.integer  "medium_id",    null: false
    t.string   "locale",       null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.string   "teaser"
    t.text     "description1"
    t.text     "description2"
  end

  add_index "medium_translations", ["locale"], name: "index_medium_translations_on_locale", using: :btree
  add_index "medium_translations", ["medium_id"], name: "index_medium_translations_on_medium_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "chapters", "books"
  add_foreign_key "media", "chapters"
end
