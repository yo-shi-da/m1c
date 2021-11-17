# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_17_063812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "meal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meal_id"], name: "index_favorites_on_meal_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.integer "sugar_amount", null: false
    t.integer "sugar_cube", null: false
    t.integer "classification", null: false
    t.string "image"
    t.datetime "start_time", null: false
    t.boolean "reading_checks", default: false, null: false
    t.text "remarks"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "personals", force: :cascade do |t|
    t.date "birth_date", null: false
    t.float "height", null: false
    t.float "body_weight", null: false
    t.boolean "gender", null: false
    t.float "bmi", null: false
    t.float "waist_circumference", null: false
    t.float "hba_onec", null: false
    t.text "underlying_disease", null: false
    t.float "intake_per_oneday", null: false
    t.text "remarks"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_personals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "meals"
  add_foreign_key "favorites", "users"
  add_foreign_key "meals", "users"
  add_foreign_key "personals", "users"
end
