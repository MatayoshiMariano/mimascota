# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140216002628) do

  create_table "adoption_dogs", force: true do |t|
    t.string   "name"
    t.string   "age"
    t.string   "breed"
    t.string   "color"
    t.integer  "user_id"
    t.text     "description"
    t.string   "image"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "adoption_dogs", ["user_id"], name: "index_adoption_dogs_on_user_id", using: :btree

  create_table "articulos", force: true do |t|
    t.string   "titulo"
    t.text     "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breeds", force: true do |t|
    t.text     "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dog_possible_owners", force: true do |t|
    t.integer  "dog_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dog_possible_owners", ["dog_id"], name: "index_dog_possible_owners_on_dog_id", using: :btree
  add_index "dog_possible_owners", ["user_id"], name: "index_dog_possible_owners_on_user_id", using: :btree

  create_table "found_dogs", force: true do |t|
    t.string   "name"
    t.string   "age"
    t.string   "color"
    t.integer  "user_id"
    t.text     "description"
    t.string   "image"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "breed_id"
  end

  add_index "found_dogs", ["breed_id"], name: "index_found_dogs_on_breed_id", using: :btree
  add_index "found_dogs", ["user_id"], name: "index_found_dogs_on_user_id", using: :btree

  create_table "lost_dogs", force: true do |t|
    t.string   "name"
    t.string   "age"
    t.string   "breed"
    t.string   "color"
    t.integer  "user_id"
    t.text     "description"
    t.string   "image"
    t.string   "last_seen_on"
    t.date     "last_seen_time"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "breed_id"
  end

  add_index "lost_dogs", ["breed_id"], name: "index_lost_dogs_on_breed_id", using: :btree
  add_index "lost_dogs", ["user_id"], name: "index_lost_dogs_on_user_id", using: :btree

  create_table "noticia", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prueba_jsons", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "cellphone"
    t.string   "phone"
    t.string   "address"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "access_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wanted_dogs", force: true do |t|
    t.string   "name"
    t.string   "age"
    t.string   "color"
    t.integer  "user_id"
    t.text     "description"
    t.string   "image"
    t.string   "last_seen_on"
    t.date     "last_seen_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "breed_id"
  end

  add_index "wanted_dogs", ["breed_id"], name: "index_wanted_dogs_on_breed_id", using: :btree
  add_index "wanted_dogs", ["user_id"], name: "index_wanted_dogs_on_user_id", using: :btree

end
