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

ActiveRecord::Schema.define(version: 20190911045402) do

  create_table "employers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_employers_on_email", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.text "info"
    t.text "requirements"
    t.integer "employer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id", "created_at"], name: "index_jobs_on_employer_id_and_created_at"
    t.index ["employer_id"], name: "index_jobs_on_employer_id"
  end

  create_table "jobs_jobseekers", id: false, force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "jobseeker_id", null: false
  end

  create_table "jobs_skills", id: false, force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "skill_id", null: false
  end

  create_table "jobseekers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "description"
  end

  create_table "jobseekers_skills", id: false, force: :cascade do |t|
    t.integer "jobseeker_id", null: false
    t.integer "skill_id", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
