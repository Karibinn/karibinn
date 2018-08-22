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

ActiveRecord::Schema.define(version: 2018_08_22_142138) do

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

  create_table "equipment", force: :cascade do |t|
    t.string "name_en"
    t.string "name_fr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment_properties", id: false, force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "equipment_id", null: false
    t.index ["property_id", "equipment_id"], name: "index_equipment_properties_on_property_id_and_equipment_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specific_type"
    t.bigint "specific_id"
    t.json "images"
    t.index ["specific_type", "specific_id"], name: "index_products_on_specific_type_and_specific_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "property_type_id"
    t.bigint "property_theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_theme_id"], name: "index_properties_on_property_theme_id"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "properties_property_services", id: false, force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "property_service_id", null: false
    t.index ["property_id", "property_service_id"], name: "index_property_and_service"
  end

  create_table "property_services", force: :cascade do |t|
    t.string "name_en"
    t.string "name_fr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_themes", force: :cascade do |t|
    t.string "name_en"
    t.string "name_fr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name_en"
    t.string "name_fr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
