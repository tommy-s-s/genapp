# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_28_034907) do
  create_table "bushos", force: :cascade do |t|
    t.string "busho_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "committees", force: :cascade do |t|
    t.string "com_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_bushos", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "busho_id", null: false
    t.date "addbusho_date"
    t.date "delbusho_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["busho_id"], name: "index_user_bushos_on_busho_id"
    t.index ["user_id"], name: "index_user_bushos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.integer "emp_no"
    t.boolean "admin", default: false
    t.date "join_date"
    t.string "liveaddress"
    t.string "station"
    t.integer "salary"
    t.date "bh_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "committee_id"
    t.integer "yakushoku_id"
    t.index ["committee_id"], name: "index_users_on_committee_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["yakushoku_id"], name: "index_users_on_yakushoku_id"
  end

  create_table "yakushokus", force: :cascade do |t|
    t.string "yaku_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_bushos", "bushos"
  add_foreign_key "user_bushos", "users"
  add_foreign_key "users", "committees"
  add_foreign_key "users", "yakushokus"
end
