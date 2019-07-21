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

ActiveRecord::Schema.define(version: 2019_07_21_011113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.integer "role", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "dead_man_switches", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "interval"
    t.string "interval_type"
    t.time "start_time"
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
    t.boolean "plot_purchased", default: false
    t.boolean "coffin_or_urn_purchased", default: false
    t.boolean "package_purchased", default: false
    t.boolean "docs_or_contract_exist", default: false
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
    t.boolean "organ_donor", default: false
    t.string "place_of_birth"
    t.string "maiden_name"
    t.boolean "deceased", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_token"
    t.string "google_uid"
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "dead_man_switches", "users"
  add_foreign_key "employers", "users"
  add_foreign_key "financial_accounts", "users"
  add_foreign_key "funerals", "users"
end
