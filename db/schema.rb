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

ActiveRecord::Schema.define(version: 20130830045235) do

  create_table "courses", force: true do |t|
    t.string   "name",                      null: false
    t.boolean  "active",     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["active"], name: "index_courses_on_active"
  add_index "courses", ["name"], name: "index_courses_on_name", unique: true

  create_table "enrollments", force: true do |t|
    t.text     "comment"
    t.integer  "person_id",                     null: false
    t.integer  "course_id",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "with_notebook", default: false
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id"
  add_index "enrollments", ["person_id"], name: "index_enrollments_on_person_id"

  create_table "people", force: true do |t|
    t.string   "name",                           null: false
    t.string   "lastname",                       null: false
    t.string   "email",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identification"
    t.boolean  "confirmed",      default: false
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true

  create_table "users", force: true do |t|
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
    t.integer  "lock_version",           default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
