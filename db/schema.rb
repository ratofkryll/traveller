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

ActiveRecord::Schema.define(version: 2019_02_04_152951) do

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

  create_table "attractions", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", default: "", null: false
    t.string "address_city", null: false
    t.string "address_postcode", default: "", null: false
    t.string "website", default: "", null: false
    t.string "facebook", default: "", null: false
    t.string "instagram", default: "", null: false
    t.string "twitter", default: "", null: false
    t.text "description", null: false
    t.string "monday_hours", default: "", null: false
    t.string "tuesday_hours", default: "", null: false
    t.string "wednesday_hours", default: "", null: false
    t.string "thursday_hours", default: "", null: false
    t.string "friday_hours", default: "", null: false
    t.string "saturday_hours", default: "", null: false
    t.string "sunday_hours", default: "", null: false
    t.string "image", null: false
    t.string "categories", default: "", null: false
    t.string "google_place", default: "", null: false
    t.bigint "city_id", null: false
    t.boolean "public", default: false, null: false
    t.boolean "featured", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_attractions_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.text "description", null: false
    t.string "language", null: false
    t.string "currency", null: false
    t.string "transit", default: "", null: false
    t.string "emergency_phone", null: false
    t.string "time_zone", null: false
    t.string "tipping_custom", default: "", null: false
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.integer "recipient", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id", null: false
    t.integer "sender", null: false
    t.index ["trip_id"], name: "index_invites_on_trip_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "name", null: false
    t.date "date", null: false
    t.string "notes", default: "", null: false
    t.boolean "public", null: false
    t.boolean "featured", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_itineraries_on_trip_id"
  end

  create_table "itinerary_items", force: :cascade do |t|
    t.bigint "itinerary_id", null: false
    t.bigint "attraction_id", null: false
    t.string "name", default: "", null: false
    t.text "notes", default: "", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_itinerary_items_on_attraction_id"
    t.index ["itinerary_id"], name: "index_itinerary_items_on_itinerary_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "attraction_id", null: false
    t.text "review", null: false
    t.integer "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_reviews_on_attraction_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.boolean "public", null: false
    t.boolean "featured", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_trips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "profile_pic", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "invite_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attractions", "cities"
  add_foreign_key "invites", "trips"
  add_foreign_key "itineraries", "trips"
  add_foreign_key "itinerary_items", "attractions"
  add_foreign_key "itinerary_items", "itineraries"
  add_foreign_key "reviews", "attractions"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end
