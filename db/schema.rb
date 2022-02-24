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

ActiveRecord::Schema.define(version: 2022_02_19_054354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "email"
    t.string "mobile"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "customer_id"
    t.string "type"
    t.boolean "is_person"
    t.string "iban"
    t.string "swift"
    t.string "sepa_ref"
    t.integer "group_id"
    t.string "tax_operation"
    t.string "sepa_date"
    t.string "client_record"
    t.string "supplier_record"
    t.string "bill_address"
    t.string "numbering_series"
    t.string "shipping_addresses"
    t.string "social_networks"
    t.string "website"
    t.string "tags"
    t.text "note"
    t.string "contact_persons"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "name"
    t.string "date"
    t.string "due_date"
    t.string "object_items"
    t.string "shipping_address"
    t.string "postal_code"
    t.string "shipping_city"
    t.string "shipping_province"
    t.string "shipping_country"
    t.string "sales_channel"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_address"
    t.string "contact_city"
    t.string "contact_cp"
    t.string "contact_province"
    t.string "contact_country"
    t.string "contact_country_code"
    t.text "decription"
    t.text "notes"
    t.string "sales_channel_id"
    t.string "payment_method"
    t.string "design_id"
    t.string "language"
    t.string "warehouse_id"
    t.string "quote_num"
    t.string "num_serield"
    t.string "currency"
    t.string "currency_change"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_proposals_on_customer_id"
  end

  add_foreign_key "proposals", "customers"
end
