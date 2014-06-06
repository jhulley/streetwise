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

ActiveRecord::Schema.define(version: 20140606072411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crimes", force: true do |t|
    t.string   "time"
    t.string   "category"
    t.string   "pddistrict"
    t.string   "address"
    t.string   "descript"
    t.string   "dayofweek"
    t.string   "resolution"
    t.datetime "date"
    t.string   "y"
    t.string   "x"
    t.string   "incidntnum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: true do |t|
    t.string "ref_id"
    t.float  "lat"
    t.float  "lon"
  end

  add_index "nodes", ["ref_id"], name: "index_nodes_on_ref_id", using: :btree

  create_table "waypoints", force: true do |t|
    t.string "way_ref"
    t.string "node_ref"
  end

end
