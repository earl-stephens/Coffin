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

ActiveRecord::Schema.define(version: 2019_07_16_213304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.integer "role"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "dead_man_switches", force: :cascade do |t|
    t.time "length_of_time"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dead_man_switches_on_user_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string "employer_company"
    t.string "employer_contact"
    t.string "phone"
    t.string "email"
    t.string "employee_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employers_on_user_id"
  end

  create_table "financial_accounts", force: :cascade do |t|
    t.string "institution_name"
    t.string "account_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_financial_accounts_on_user_id"
  end

  create_table "funerals", force: :cascade do |t|
    t.integer "burial_cremation"
    t.string "funeral_home_name"
    t.string "funeral_home_phone"
    t.string "funeral_home_address"
    t.integer "type_of_service"
    t.boolean "plot_purchased"
    t.boolean "coffin_or_urn_purchased"
    t.boolean "package_purchased"
    t.boolean "docs_or_contract_exist"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_funerals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.integer "role"
    t.boolean "organ_donor"
    t.string "place_of_birth"
    t.string "maiden_name"
    t.boolean "deceased"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "dead_man_switches", "users"
  add_foreign_key "employers", "users"
  add_foreign_key "financial_accounts", "users"
  add_foreign_key "funerals", "users"
end
