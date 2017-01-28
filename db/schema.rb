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

ActiveRecord::Schema.define(version: 20170128231151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "factions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pilots", force: :cascade do |t|
    t.integer  "ship_id"
    t.integer  "faction_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pilots_squadrons", id: false, force: :cascade do |t|
    t.integer "squadron_id"
    t.integer "pilot_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ships", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "squadrons", force: :cascade do |t|
    t.integer  "faction_id"
    t.integer  "player_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "squadrons_upgrades", id: false, force: :cascade do |t|
    t.integer "squadron_id"
    t.integer "upgrade_id"
  end

  create_table "tournament_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.date     "date"
    t.string   "name"
    t.integer  "tournament_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "upgrade_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upgrades", force: :cascade do |t|
    t.string   "name"
    t.integer  "upgrade_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "pilots", "ships"
  add_foreign_key "pilots_squadrons", "pilots"
  add_foreign_key "pilots_squadrons", "squadrons"
  add_foreign_key "squadrons", "factions"
  add_foreign_key "squadrons", "players"
  add_foreign_key "squadrons", "tournaments"
  add_foreign_key "squadrons_upgrades", "squadrons"
  add_foreign_key "squadrons_upgrades", "upgrades"
  add_foreign_key "tournaments", "tournament_types"
  add_foreign_key "upgrades", "upgrade_types"
end