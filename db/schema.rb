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

ActiveRecord::Schema.define(version: 2019_07_30_131005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payslips", force: :cascade do |t|
    t.string "client_id", null: false
    t.string "vat", null: false
    t.datetime "date", null: false
    t.decimal "gross", precision: 8, scale: 2, null: false
    t.decimal "national_insurance_rate", precision: 4, scale: 2, null: false
    t.decimal "national_insurance_deductions", precision: 8, scale: 2, null: false
    t.decimal "tax_rate", precision: 4, scale: 2, null: false
    t.decimal "taxes", precision: 8, scale: 2, null: false
    t.decimal "net", precision: 8, scale: 2, null: false
    t.bigint "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_payslips_on_client_id", unique: true
    t.index ["report_id"], name: "index_payslips_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "filename", null: false
    t.string "year", null: false
    t.string "month", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filename"], name: "index_reports_on_filename", unique: true
  end

  add_foreign_key "payslips", "reports"
end
