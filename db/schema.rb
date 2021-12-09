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

ActiveRecord::Schema.define(version: 2021_12_09_050722) do

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

  create_table "foods", force: :cascade do |t|
    t.integer "classification"
    t.string "food_name"
    t.float "food_amount"
    t.float "sugar_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_groups_on_owner_id"
  end

  create_table "meals", force: :cascade do |t|
    t.integer "sugar_amount", null: false
    t.integer "sugar_cube", null: false
    t.integer "classification", null: false
    t.text "image", null: false
    t.datetime "start_time", null: false
    t.boolean "reading_checks", default: false, null: false
    t.text "remarks"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "personals", force: :cascade do |t|
    t.date "birth_date", null: false
    t.float "height", null: false
    t.float "body_weight", null: false
    t.integer "gender", null: false
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

  create_table "posts", force: :cascade do |t|
    t.text "owner_comment", null: false
    t.integer "owner_sugar_amount", null: false
    t.integer "difference", null: false
    t.bigint "meal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meal_id"], name: "index_posts_on_meal_id"
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
  add_foreign_key "groups", "users", column: "owner_id"
  add_foreign_key "meals", "users"
  add_foreign_key "members", "groups"
  add_foreign_key "members", "users"
  add_foreign_key "personals", "users"
  add_foreign_key "posts", "meals"
end
