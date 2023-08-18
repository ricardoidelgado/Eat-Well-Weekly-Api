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

ActiveRecord::Schema[7.0].define(version: 2023_08_18_013153) do
  create_table "daily_meal_plans", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "breakfast"
    t.integer "lunch"
    t.integer "dinner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.integer "calories"
    t.integer "fat"
    t.integer "sodium"
    t.integer "carbs"
    t.integer "protein"
    t.integer "sugar"
    t.integer "cholesterol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "meal_ingredients", force: :cascade do |t|
    t.integer "meal_id"
    t.integer "ingredient_id"
    t.integer "ingredient_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_meal_plans", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "sunday"
    t.integer "monday"
    t.integer "tuesday"
    t.integer "wednesday"
    t.integer "thursday"
    t.integer "friday"
    t.integer "saturday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
