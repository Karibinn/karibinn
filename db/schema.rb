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

ActiveRecord::Schema.define(version: 2018_09_21_114741) do

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

  create_table "activities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name_en"
    t.string "name_fr"
  end

  create_table "amenities_room_types", id: false, force: :cascade do |t|
    t.bigint "room_type_id", null: false
    t.bigint "amenity_id", null: false
    t.index ["room_type_id", "amenity_id"], name: "index_amenities_room_types_on_room_type_id_and_amenity_id"
  end

  create_table "booking_items", force: :cascade do |t|
    t.bigint "booking_id"
    t.integer "room_type_id"
    t.datetime "checkin_date", null: false
    t.datetime "checkout_date", null: false
    t.integer "price_cents", null: false
    t.integer "guests", limit: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.string "type", limit: 32, default: "BookingItems::Property", null: false
    t.index ["booking_id"], name: "index_booking_items_on_booking_id"
    t.index ["product_id"], name: "index_booking_items_on_product_id"
    t.index ["room_type_id"], name: "index_booking_items_on_room_type_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "state", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "country"
    t.integer "number_of_adults"
    t.integer "number_of_children"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name_fr"
    t.string "name_en"
    t.string "object_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name_en"
    t.string "name_fr"
    t.text "description_en"
    t.text "description_fr"
    t.string "small_image"
    t.string "large_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_locations_on_slug", unique: true
  end

  create_table "product_images", force: :cascade do |t|
    t.string "image"
    t.text "description"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "slug"
    t.string "title_en"
    t.text "description_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specific_type"
    t.bigint "specific_id"
    t.bigint "category_id"
    t.text "description_fr"
    t.string "title_fr"
    t.bigint "location_id"
    t.string "real_name"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["location_id"], name: "index_products_on_location_id"
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

  create_table "room_types", force: :cascade do |t|
    t.integer "guest_capacity", limit: 2, default: 2, null: false
    t.integer "bedrooms", limit: 2, default: 1, null: false
    t.integer "single_beds", limit: 2, default: 0, null: false
    t.integer "double_beds", limit: 2, default: 1, null: false
    t.integer "baths", limit: 2, default: 1, null: false
    t.bigint "property_id"
    t.string "name_en"
    t.string "name_fr"
    t.text "description_en"
    t.text "description_fr"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.index ["property_id"], name: "index_room_types_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.boolean "guest", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booking_items", "bookings"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "locations"
end
