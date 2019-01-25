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

ActiveRecord::Schema.define(version: 2019_01_25_214406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "address_city"
    t.string "address_postcode"
    t.string "website"
    t.string "facebook"
    t.string "instagram"
    t.string "twitter"
    t.text "description"
    t.string "monday_hours"
    t.string "tuesday_hours"
    t.string "wednesday_hours"
    t.string "thursday_hours"
    t.string "friday_hours"
    t.string "saturday_hours"
    t.string "sunday_hours"
    t.string "image"
    t.string "categories"
    t.string "google_place"
    t.bigint "city_id"
    t.boolean "public"
    t.boolean "featured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_attractions_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.text "description"
    t.string "language"
    t.string "currency"
    t.string "transit"
    t.string "emergency_phone"
    t.string "time_zone"
    t.string "tipping_custom"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "user_trip_id"
    t.integer "recipient"
    t.string "email"
    t.text "message"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_trip_id"], name: "index_invites_on_user_trip_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "notes"
    t.boolean "public"
    t.boolean "featured"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_itineraries_on_trip_id"
  end

  create_table "itinerary_items", force: :cascade do |t|
    t.bigint "itinerary_id"
    t.bigint "attraction_id"
    t.string "name"
    t.text "notes"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_itinerary_items_on_attraction_id"
    t.index ["itinerary_id"], name: "index_itinerary_items_on_itinerary_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "attraction_id"
    t.text "review"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_reviews_on_attraction_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.boolean "public"
    t.boolean "featured"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_trips", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trip_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "profile_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attractions", "cities"
  add_foreign_key "invites", "user_trips"
  add_foreign_key "itineraries", "trips"
  add_foreign_key "itinerary_items", "attractions"
  add_foreign_key "itinerary_items", "itineraries"
  add_foreign_key "reviews", "attractions"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end
