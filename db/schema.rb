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

ActiveRecord::Schema.define(version: 2022_01_31_215101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hard_counters", force: :cascade do |t|
    t.bigint "advantage_hero_id", null: false
    t.bigint "disadvantage_hero_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["advantage_hero_id"], name: "index_hard_counters_on_advantage_hero_id"
    t.index ["disadvantage_hero_id"], name: "index_hard_counters_on_disadvantage_hero_id"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id", null: false
    t.bigint "advantage_hero_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "can_heal_self", default: false
    t.float "heal_self_strength"
    t.index ["advantage_hero_id"], name: "index_heros_on_advantage_hero_id"
    t.index ["role_id"], name: "index_heros_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "hard_counters", "heros", column: "advantage_hero_id"
  add_foreign_key "hard_counters", "heros", column: "disadvantage_hero_id"
  add_foreign_key "heros", "heros", column: "advantage_hero_id"
  add_foreign_key "heros", "roles"
end
