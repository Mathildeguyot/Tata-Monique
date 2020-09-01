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

ActiveRecord::Schema.define(version: 2020_09_01_080413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "documents", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "familial_situations", force: :cascade do |t|
    t.integer "children"
    t.string "relationship"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_familial_situations_on_user_id"
  end

  create_table "habitations", force: :cascade do |t|
    t.integer "number"
    t.string "street"
    t.string "city"
    t.string "zip_code"
    t.string "category"
    t.float "rent"
    t.integer "size"
    t.date "lease_start_date"
    t.boolean "furnished"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_habitations_on_user_id"
  end

  create_table "healths", force: :cascade do |t|
    t.string "ssn"
    t.string "social_security"
    t.string "health_insurance"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_healths_on_user_id"
  end

  create_table "professional_situations", force: :cascade do |t|
    t.integer "income"
    t.string "occupation"
    t.string "fiscal_number"
    t.string "contract"
    t.string "company_name"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "iban"
    t.boolean "fiscal_attach"
    t.index ["user_id"], name: "index_professional_situations_on_user_id"
  end

  create_table "subtasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "deadline"
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "subtask_type"
    t.string "document_type"
    t.index ["task_id"], name: "index_subtasks_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "deadline"
    t.string "organization"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "phone_number"
    t.string "ID_number"
    t.string "nationality"
    t.string "birth_location"
    t.string "username"
    t.string "zip_code_location"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usersubtasks", force: :cascade do |t|
    t.boolean "done"
    t.bigint "user_id", null: false
    t.bigint "subtask_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subtask_id"], name: "index_usersubtasks_on_subtask_id"
    t.index ["user_id"], name: "index_usersubtasks_on_user_id"
  end

  create_table "usertasks", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.boolean "done"
    t.index ["task_id"], name: "index_usertasks_on_task_id"
    t.index ["user_id"], name: "index_usertasks_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "documents", "users"
  add_foreign_key "familial_situations", "users"
  add_foreign_key "habitations", "users"
  add_foreign_key "healths", "users"
  add_foreign_key "professional_situations", "users"
  add_foreign_key "subtasks", "tasks"
  add_foreign_key "usersubtasks", "subtasks"
  add_foreign_key "usersubtasks", "users"
  add_foreign_key "usertasks", "tasks"
  add_foreign_key "usertasks", "users"
end
