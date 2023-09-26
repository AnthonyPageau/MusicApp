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

ActiveRecord::Schema[7.0].define(version: 2023_09_26_145951) do
  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists_genres", id: false, force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "artist_id", null: false
    t.index ["artist_id"], name: "index_artists_genres_on_artist_id"
    t.index ["genre_id"], name: "index_artists_genres_on_genre_id"
  end

  create_table "artists_sub_genres", id: false, force: :cascade do |t|
    t.integer "sub_genre_id", null: false
    t.integer "artist_id", null: false
    t.index ["artist_id"], name: "index_artists_sub_genres_on_artist_id"
    t.index ["sub_genre_id"], name: "index_artists_sub_genres_on_sub_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.integer "sub_genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "artist_id"
    t.string "song_link"
    t.integer "user_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["sub_genre_id"], name: "index_songs_on_sub_genre_id"
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "sub_genres", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_sub_genres_on_genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "songs", "artists"
  add_foreign_key "songs", "sub_genres"
  add_foreign_key "songs", "users"
  add_foreign_key "sub_genres", "genres"
end
