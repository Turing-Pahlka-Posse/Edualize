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

ActiveRecord::Schema.define(version: 20161213192534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "districts", force: :cascade do |t|
    t.integer  "school_type_id"
    t.integer  "state_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "total"
    t.integer  "number_reporting"
    t.index ["school_type_id"], name: "index_districts_on_school_type_id", using: :btree
    t.index ["state_id"], name: "index_districts_on_state_id", using: :btree
  end

  create_table "median_expenditures", force: :cascade do |t|
    t.integer  "total"
    t.integer  "instruction_related"
    t.integer  "support_services"
    t.integer  "school_type_id"
    t.integer  "state_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["school_type_id"], name: "index_median_expenditures_on_school_type_id", using: :btree
    t.index ["state_id"], name: "index_median_expenditures_on_state_id", using: :btree
  end

  create_table "school_types", force: :cascade do |t|
    t.string   "school_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "st_name"
    t.string   "st_abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer  "school_type_id"
    t.integer  "state_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["school_type_id"], name: "index_students_on_school_type_id", using: :btree
    t.index ["state_id"], name: "index_students_on_state_id", using: :btree
  end

  add_foreign_key "districts", "school_types"
  add_foreign_key "districts", "states"
  add_foreign_key "median_expenditures", "school_types"
  add_foreign_key "median_expenditures", "states"
  add_foreign_key "students", "school_types"
  add_foreign_key "students", "states"
end
