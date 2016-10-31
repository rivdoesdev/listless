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

ActiveRecord::Schema.define(version: 20161031183528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allaccesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "assignee_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_allaccesses_on_user_id", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.string   "title",                      null: false
    t.integer  "difficulty",                 null: false
    t.integer  "energy",                     null: false
    t.datetime "due_date"
    t.string   "reward"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.boolean  "public",     default: false
    t.boolean  "archived",   default: false
    t.time     "time"
    t.index ["user_id"], name: "index_lists_on_user_id", using: :btree
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_permissions_on_list_id", using: :btree
    t.index ["user_id"], name: "index_permissions_on_user_id", using: :btree
  end

  create_table "startovers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "list_id"
    t.boolean  "completed",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["list_id"], name: "index_startovers_on_list_id", using: :btree
    t.index ["user_id"], name: "index_startovers_on_user_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title",                          null: false
    t.text     "description"
    t.integer  "position"
    t.boolean  "completed",      default: false
    t.integer  "list_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "parent_task_id"
    t.index ["list_id"], name: "index_tasks_on_list_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "email",                           null: false
    t.string   "password"
    t.string   "birthday"
    t.string   "phone_number"
    t.text     "about_me"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "encrypted_password",  limit: 128
    t.string   "confirmation_token",  limit: 128
    t.string   "remember_token",      limit: 128
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "allaccesses", "users"
  add_foreign_key "lists", "users"
  add_foreign_key "permissions", "lists"
  add_foreign_key "permissions", "users"
  add_foreign_key "startovers", "lists"
  add_foreign_key "startovers", "users"
  add_foreign_key "tasks", "lists"
end
