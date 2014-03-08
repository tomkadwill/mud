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

ActiveRecord::Schema.define(version: 20130627083842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "case_studies", force: true do |t|
    t.string   "title"
    t.integer  "position"
    t.boolean  "publish"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "body"
    t.text     "page_title"
    t.text     "meta_description"
    t.text     "meta_keyword"
    t.text     "summary"
    t.string   "slug"
  end

  add_index "case_studies", ["slug"], name: "index_case_studies_on_slug", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true, using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "body"
    t.text     "page_title"
    t.text     "meta_description"
    t.text     "meta_keyword"
    t.string   "navigation_title"
    t.integer  "position"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "publish"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "job_title"
    t.string   "office"
    t.string   "phone"
    t.string   "email"
    t.text     "bio"
    t.string   "image"
    t.integer  "position"
    t.boolean  "publish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redactor_assets", force: true do |t|
    t.integer  "user_id"
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "resources", force: true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "body"
    t.date     "date"
    t.string   "page_title"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.boolean  "publish"
    t.integer  "position"
    t.string   "navigation_title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "service_types", force: true do |t|
    t.string   "name"
    t.boolean  "publish"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "body"
    t.text     "page_title"
    t.text     "meta_description"
    t.text     "meta_keyword"
    t.text     "navigation_title"
    t.integer  "position"
    t.boolean  "publish"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "service_type_id"
    t.string   "slug"
  end

  add_index "services", ["service_type_id"], name: "index_services_on_service_type_id", using: :btree
  add_index "services", ["slug"], name: "index_services_on_slug", using: :btree

end
