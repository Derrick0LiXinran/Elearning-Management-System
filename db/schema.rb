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

ActiveRecord::Schema.define(version: 2020_09_18_053918) do

  create_table "carts", force: :cascade do |t|
    t.integer "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_carts_on_student_id"
  end

  create_table "carts_courses", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_carts_courses_on_cart_id"
    t.index ["course_id"], name: "index_carts_courses_on_course_id"
  end

  create_table "course_packages", force: :cascade do |t|
    t.integer "course_id"
    t.integer "teacher_id"
    t.integer "cart_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_number"
    t.string "name"
    t.integer "major_id"
    t.integer "discipline_id"
    t.float "price"
    t.integer "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses_student_infos", id: false, force: :cascade do |t|
    t.integer "student_info_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_courses_student_infos_on_course_id"
    t.index ["student_info_id"], name: "index_courses_student_infos_on_student_info_id"
  end

  create_table "courses_teacher_infos", id: false, force: :cascade do |t|
    t.integer "teacher_info_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_courses_teacher_infos_on_course_id"
    t.index ["teacher_info_id"], name: "index_courses_teacher_infos_on_teacher_info_id"
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
    t.integer "teacher_id"
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "credit_card_infos", force: :cascade do |t|
    t.string "student_info_id"
    t.string "name"
    t.string "card_number"
    t.string "expiration_date"
    t.string "cvv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "text"
    t.string "title"
  end

  create_table "majors", force: :cascade do |t|
    t.string "major_name"
    t.integer "discipline_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchased_histories", force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_infos", force: :cascade do |t|
    t.integer "major"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "student_id"
  end

  create_table "teacher_infos", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "discipline_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
  end

end
