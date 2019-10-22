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

ActiveRecord::Schema.define(version: 2019_10_22_164211) do

  create_table "arrests", force: :cascade do |t|
    t.string "day_of_week"
    t.string "description"
    t.integer "crime_id"
    t.integer "player_id"
    t.string "date"
  end

  create_table "crimes", force: :cascade do |t|
    t.string "category"
  end

  create_table "players", force: :cascade do |t|
    t.string "position"
    t.string "name"
  end

end
