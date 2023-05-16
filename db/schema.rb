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

ActiveRecord::Schema[7.0].define(version: 2023_05_16_065102) do
  create_table "class_rooms", force: :cascade do |t|
    t.string "classroom_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string "college_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "dep_name"
    t.integer "college_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_departments_on_college_id"
  end

  create_table "evaluation_criteria", force: :cascade do |t|
    t.string "criteria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluation_forms", force: :cascade do |t|
    t.string "evaluator"
    t.text "form"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluation_results", force: :cascade do |t|
    t.integer "instructor_id", null: false
    t.integer "semester_id", null: false
    t.text "detailed_result"
    t.float "total_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_evaluation_results_on_instructor_id"
    t.index ["semester_id"], name: "index_evaluation_results_on_semester_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "college_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["college_id"], name: "index_instructors_on_college_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.string "sem"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "college_id", null: false
    t.integer "department_id", null: false
    t.integer "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_students_on_college_id"
    t.index ["department_id"], name: "index_students_on_department_id"
    t.index ["semester_id"], name: "index_students_on_semester_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "department_id", null: false
    t.integer "instructor_id", null: false
    t.integer "semester_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_tasks_on_course_id"
    t.index ["department_id"], name: "index_tasks_on_department_id"
    t.index ["instructor_id"], name: "index_tasks_on_instructor_id"
    t.index ["semester_id"], name: "index_tasks_on_semester_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
  end

  add_foreign_key "departments", "colleges"
  add_foreign_key "evaluation_results", "instructors"
  add_foreign_key "evaluation_results", "semesters"
  add_foreign_key "instructors", "colleges"
  add_foreign_key "students", "colleges"
  add_foreign_key "students", "departments"
  add_foreign_key "students", "semesters"
  add_foreign_key "tasks", "courses"
  add_foreign_key "tasks", "departments"
  add_foreign_key "tasks", "instructors"
  add_foreign_key "tasks", "semesters"
end
