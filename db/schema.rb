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

ActiveRecord::Schema.define(version: 2022_08_02_084949) do

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

  create_table "object_items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "desc"
    t.integer "units"
    t.float "subtotal"
    t.integer "discount"
    t.integer "tax"
    t.integer "retention"
    t.bigint "propsal_id"
    t.index ["propsal_id"], name: "index_object_items_on_propsal_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "name"
    t.string "date"
    t.string "due_date"
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
    t.string "url"
    t.index ["customer_id"], name: "index_proposals_on_customer_id"
  end

  create_table "pvgis", force: :cascade do |t|
    t.string "name"
    t.text "month1"
    t.text "month2"
    t.text "month3"
    t.text "month4"
    t.text "month5"
    t.text "month6"
    t.text "month7"
    t.text "month8"
    t.text "month9"
    t.text "month10"
    t.text "month11"
    t.text "month12"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "proposal_id"
    t.index ["proposal_id"], name: "index_pvgis_on_proposal_id"
  end

  create_table "pvgisdata", force: :cascade do |t|
    t.bigint "proposal_id", null: false
    t.float "lat"
    t.float "lon"
    t.float "peakpower"
    t.float "angle"
    t.float "loss"
    t.float "slope"
    t.string "azimuth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposal_id"], name: "index_pvgisdata_on_proposal_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "proposals", "customers"
  add_foreign_key "pvgisdata", "proposals"
end
