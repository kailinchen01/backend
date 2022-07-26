# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_12_092710) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "deceased_posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "gender"
    t.integer "age"
    t.date "date_of_birth"
    t.date "date_found"
    t.string "location"
    t.string "vague_location"
    t.string "hair_length"
    t.string "hair_color"
    t.string "skin_color"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ethnicity"
    t.string "age_range"
    t.float "lat"
    t.float "lng"
    t.index ["user_id"], name: "index_deceased_posts_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "type"
    t.string "owner_type"
    t.integer "owner_id"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_images_on_owner"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "markers", force: :cascade do |t|
    t.string "lonlat", null: false
    t.string "place_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "marker_id", null: false
    t.string "lonlat", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "place_name"
    t.string "category"
    t.index ["marker_id"], name: "index_reports_on_marker_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_photo_id"
    t.index ["profile_photo_id"], name: "index_users_on_profile_photo_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "deceased_posts", "users"
  add_foreign_key "images", "users"
  add_foreign_key "reports", "markers"
  add_foreign_key "reports", "users"
end
