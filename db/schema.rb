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

ActiveRecord::Schema.define(version: 20141026172155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: true do |t|
    t.string  "name"
    t.string  "position"
    t.integer "number"
    t.integer "team_id"
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "projections", force: true do |t|
    t.string  "class_name"
    t.integer "last_id",    default: 0
    t.boolean "solid",      default: true
  end

  add_index "projections", ["class_name"], name: "index_projections_on_class_name", using: :btree

  create_table "teams", force: true do |t|
    t.string  "name"
    t.integer "age"
    t.string  "gender"
  end

end
