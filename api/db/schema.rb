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

ActiveRecord::Schema.define(version: 20160920062042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :integer, default: -> { "nextval('table_categories_id_seq'::regclass)" }, force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer "company_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categorizations_on_category_id", using: :btree
    t.index ["company_id"], name: "index_categorizations_on_company_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "external_id"
    t.string   "name"
    t.boolean  "active",            default: false
    t.boolean  "omit"
    t.boolean  "needs_update"
    t.datetime "needs_update_sent"
    t.datetime "last_updated"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "island"
    t.string   "phone_1"
    t.string   "phone_2"
    t.string   "fax_pre"
    t.string   "fax"
    t.string   "website"
    t.string   "email"
    t.boolean  "certified"
    t.string   "country"
    t.integer  "established_year"
    t.string   "products"
    t.string   "products_info"
    t.text     "notes_1"
    t.text     "notes_2"
    t.boolean  "employ"
    t.boolean  "annual_volume"
    t.boolean  "exporter"
    t.boolean  "export_sales"
    t.string   "title_1"
    t.string   "salutation_1"
    t.string   "salutation_2"
    t.boolean  "tob_grower"
    t.boolean  "tob_distributor"
    t.boolean  "tob_wholesaler"
    t.boolean  "tob_processor"
    t.boolean  "tob_manufacturer"
    t.boolean  "tob_retailer"
    t.boolean  "tob_other"
    t.string   "tob_otherdesc"
    t.boolean  "serv_mailorder"
    t.boolean  "serv_delivery"
    t.boolean  "serv_packing"
    t.boolean  "serv_growing"
    t.boolean  "serv_labeling"
    t.boolean  "serv_bulk"
    t.boolean  "serv_retail"
    t.boolean  "serv_other"
    t.string   "serv_other_desc"
    t.string   "claim_token"
    t.index ["external_id"], name: "index_companies_on_external_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "external_id"
    t.integer  "company_id"
    t.string   "title"
    t.string   "full_name"
    t.string   "salutation"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "email"
    t.string   "phone_1"
    t.string   "phone_2"
    t.string   "phone_type_1"
    t.string   "phone_type_2"
    t.boolean  "primary_contact"
    t.datetime "last_updated"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["company_id"], name: "index_contacts_on_company_id", using: :btree
  end

  create_table "user_companies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_user_companies_on_company_id", using: :btree
    t.index ["user_id"], name: "index_user_companies_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
