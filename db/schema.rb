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

ActiveRecord::Schema[7.0].define(version: 2023_06_16_204435) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "departments", force: :cascade do |t|
    t.string "dep_name"
    t.bigint "college_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_departments_on_college_id"
  end

  create_table "evaluation_criteria", force: :cascade do |t|
    t.string "criteria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "evaluation_forms", force: :cascade do |t|
    t.string "evaluator"
    t.text "form_fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluation_records", force: :cascade do |t|
    t.jsonb "record"
    t.string "evaluators"
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_evaluation_records_on_task_id"
  end

  create_table "evaluation_results", force: :cascade do |t|
    t.jsonb "percentage_agreement"
    t.float "overall_percentage_agreement"
    t.bigint "evaluation_record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_record_id"], name: "index_evaluation_results_on_evaluation_record_id"
  end

  create_table "ho_d_departments", force: :cascade do |t|
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instructor_id", null: false
    t.index ["department_id"], name: "index_ho_d_departments_on_department_id"
    t.index ["instructor_id"], name: "index_ho_d_departments_on_instructor_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.bigint "college_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "college_id", null: false
    t.bigint "department_id", null: false
    t.bigint "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_students_on_college_id"
    t.index ["department_id"], name: "index_students_on_department_id"
    t.index ["semester_id"], name: "index_students_on_semester_id"
  end

  create_table "students_tasks", id: false, force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "student_id", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "department_id", null: false
    t.bigint "instructor_id", null: false
    t.bigint "semester_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "start_eval"
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
  add_foreign_key "evaluation_records", "tasks"
  add_foreign_key "evaluation_results", "evaluation_records"
  add_foreign_key "ho_d_departments", "departments"
  add_foreign_key "ho_d_departments", "instructors"
  add_foreign_key "instructors", "colleges"
  add_foreign_key "students", "colleges"
  add_foreign_key "students", "departments"
  add_foreign_key "students", "semesters"
  add_foreign_key "tasks", "courses"
  add_foreign_key "tasks", "departments"
  add_foreign_key "tasks", "instructors"
  add_foreign_key "tasks", "semesters"
end
