# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160312122202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "addresses", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "address1"
    t.string   "address2"
    t.string   "landmark"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.integer  "profile_id"
    t.integer  "address_type_id"
    t.index ["address_type_id"], name: "index_addresses_on_address_type_id", using: :btree
    t.index ["profile_id"], name: "index_addresses_on_profile_id", using: :btree
  end

  create_table "amount_transactions", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "parent_id"
    t.string   "parent_name"
    t.float    "amount"
  end

  create_table "board_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "boards", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.integer  "board_type_id"
    t.index ["board_type_id"], name: "index_boards_on_board_type_id", using: :btree
  end

  create_table "class_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.integer  "board_id"
    t.string   "class_name"
    t.string   "section"
    t.string   "major"
    t.index ["board_id"], name: "index_class_lists_on_board_id", using: :btree
  end

  create_table "exam_types", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.integer  "class_list_id"
    t.string   "major"
    t.index ["class_list_id"], name: "index_exam_types_on_class_list_id", using: :btree
  end

  create_table "fees_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "marks", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "mark"
    t.integer  "subject_id"
    t.integer  "profile_id"
    t.integer  "exam_type_id"
    t.index ["exam_type_id"], name: "index_marks_on_exam_type_id", using: :btree
    t.index ["profile_id"], name: "index_marks_on_profile_id", using: :btree
    t.index ["subject_id"], name: "index_marks_on_subject_id", using: :btree
  end

  create_table "message_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "title"
    t.string   "header_content"
    t.integer  "board_id"
    t.integer  "message_type_id"
    t.index ["board_id"], name: "index_messages_on_board_id", using: :btree
    t.index ["message_type_id"], name: "index_messages_on_message_type_id", using: :btree
  end

  create_table "payment_details", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "profile_id"
    t.integer  "payment_info_id"
    t.float    "paid_amount"
    t.index ["payment_info_id"], name: "index_payment_details_on_payment_info_id", using: :btree
    t.index ["profile_id"], name: "index_payment_details_on_profile_id", using: :btree
  end

  create_table "payment_infos", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "class_list_id"
    t.integer  "board_id"
    t.integer  "fees_type_id"
    t.float    "amount"
    t.index ["board_id"], name: "index_payment_infos_on_board_id", using: :btree
    t.index ["class_list_id"], name: "index_payment_infos_on_class_list_id", using: :btree
    t.index ["fees_type_id"], name: "index_payment_infos_on_fees_type_id", using: :btree
  end

  create_table "profile_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "roll_no"
    t.integer  "profile_type_id"
    t.integer  "board_id"
    t.integer  "class_list_id"
    t.integer  "user_id"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "gender"
    t.string   "marital_status"
    t.string   "husband_name"
    t.date     "date_of_birth"
    t.string   "emergency_contact_number"
    t.string   "guardian_contact_number"
    t.string   "guardian_email_id"
    t.string   "blood_group"
    t.index ["board_id"], name: "index_profiles_on_board_id", using: :btree
    t.index ["class_list_id"], name: "index_profiles_on_class_list_id", using: :btree
    t.index ["profile_type_id"], name: "index_profiles_on_profile_type_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salary_details", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "profile_id"
    t.integer  "board_id"
    t.integer  "fees_type_id"
    t.float    "amount"
    t.index ["board_id"], name: "index_salary_details_on_board_id", using: :btree
    t.index ["fees_type_id"], name: "index_salary_details_on_fees_type_id", using: :btree
    t.index ["profile_id"], name: "index_salary_details_on_profile_id", using: :btree
  end

  create_table "status_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.integer  "class_list_id"
    t.index ["class_list_id"], name: "index_subjects_on_class_list_id", using: :btree
  end

  create_table "user_previous_details", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "display_order"
    t.integer  "profile_id"
    t.string   "board_name"
    t.string   "designation"
    t.integer  "years_on_board"
    t.string   "reason"
    t.date     "date_joined"
    t.date     "date_relieved"
    t.boolean  "is_student"
    t.index ["profile_id"], name: "index_user_previous_details_on_profile_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id"
    t.integer  "profile_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["profile_id"], name: "index_users_on_profile_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "addresses", "address_types"
  add_foreign_key "addresses", "profiles"
  add_foreign_key "boards", "board_types"
  add_foreign_key "class_lists", "boards"
  add_foreign_key "exam_types", "class_lists"
  add_foreign_key "marks", "exam_types"
  add_foreign_key "marks", "profiles"
  add_foreign_key "marks", "subjects"
  add_foreign_key "messages", "boards"
  add_foreign_key "messages", "message_types"
  add_foreign_key "payment_details", "payment_infos"
  add_foreign_key "payment_details", "profiles"
  add_foreign_key "payment_infos", "boards"
  add_foreign_key "payment_infos", "class_lists"
  add_foreign_key "payment_infos", "fees_types"
  add_foreign_key "profiles", "board_types", column: "board_id"
  add_foreign_key "profiles", "class_lists"
  add_foreign_key "profiles", "profile_types"
  add_foreign_key "profiles", "users"
  add_foreign_key "salary_details", "boards"
  add_foreign_key "salary_details", "fees_types"
  add_foreign_key "salary_details", "profiles"
  add_foreign_key "subjects", "class_lists"
  add_foreign_key "user_previous_details", "profiles"
  add_foreign_key "users", "profiles"
  add_foreign_key "users", "roles"
end
