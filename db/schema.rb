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

ActiveRecord::Schema[7.1].define(version: 2023_10_10_202242) do
  create_table "animation_data", force: :cascade do |t|
    t.string "hashvalue"
    t.float "burst_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "stake_amount"
    t.float "predicted_y_value"
    t.string "betid"
    t.decimal "outcome"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.integer "amount"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_deposits_on_user_id"
  end

  create_table "last_y_values", force: :cascade do |t|
    t.string "hashvalue"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "phone_number"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "balance"
    t.index ["user_id"], name: "index_users_on_user_id"
  end

  create_table "withdraws", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_withdraws_on_user_id"
  end

  add_foreign_key "bets", "users"
  add_foreign_key "deposits", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "withdraws", "users"
end
