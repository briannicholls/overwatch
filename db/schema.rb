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

ActiveRecord::Schema[7.0].define(version: 2022_10_11_234533) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.bigint "hero_id", null: false
    t.string "keybinding"
    t.integer "cooldown"
    t.integer "duration"
    t.boolean "has_aoe_effect", default: false
    t.integer "aoe_effect_radius"
    t.integer "base_beam_damage"
    t.boolean "applies_damage_over_time", default: false
    t.boolean "applies_speed_boost", default: false
    t.boolean "applies_stun", default: false
    t.boolean "applies_shield", default: false
    t.integer "cast_time"
    t.boolean "applies_headshot_damage", default: false
    t.integer "damage_over_time"
    t.boolean "is_projectile", default: false
    t.float "projectile_speed"
    t.integer "max_damage_per_projectile"
    t.float "projectiles_fired_per_second"
    t.float "max_range"
    t.integer "hp"
    t.boolean "is_ultimate", default: false
    t.integer "ultimate_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "is_passive", default: false
    t.boolean "is_primary_fire"
    t.boolean "is_secondary_fire", default: false
    t.boolean "is_beam", default: false
    t.integer "max_beam_damage"
    t.integer "reload_time"
    t.float "fire_rate"
    t.float "beam_width"
    t.float "initial_falloff_distance"
    t.float "spread_angle"
    t.float "final_falloff_disance"
    t.float "min_damage_per_projectile"
    t.boolean "applies_boop", default: false
    t.float "max_boop_distance"
    t.integer "min_melee_damage"
    t.boolean "applies_splash_damage", default: false
    t.float "splash_radius"
    t.integer "max_aoe_damage"
    t.integer "min_aoe_damage"
    t.integer "ammo"
    t.boolean "applies_self_damage_reduction", default: false
    t.boolean "applies_damage_boost"
    t.float "percent_damage_reduction_self"
    t.float "percent_damage_boost_self"
    t.float "percent_damage_boost_aoe"
    t.integer "max_melee_damage"
    t.integer "stun_duration"
    t.boolean "is_barrier"
    t.boolean "applies_speed_penalty_self", default: false
    t.boolean "applies_speed_penalty_enemy", default: false
    t.float "min_boop_distance"
    t.boolean "shares_ammo_with_primary"
    t.boolean "ignores_barriers", default: false
    t.boolean "is_hitscan", default: false
    t.integer "shields"
    t.boolean "obeys_gravity"
    t.integer "recovery_rate"
    t.boolean "is_turret", default: false
    t.boolean "applies_armor", default: false
    t.integer "armor_provided"
    t.integer "charges"
    t.text "aoe_effect_types", default: [], array: true
    t.integer "single_charge_regeneration_duration"
    t.boolean "applies_healing", default: false
    t.boolean "applies_healing_self"
    t.float "projectiles_per_shot"
    t.boolean "can_target_self"
    t.boolean "applies_invulnerability_self"
    t.boolean "applies_speed_boost_self"
    t.boolean "applies_apeed_boost_target"
    t.boolean "can_be_cancelled", default: false
    t.integer "recovery_time"
    t.integer "cooldown_timer_delay"
    t.integer "cast_animation_time"
    t.boolean "inflicts_self_damage"
    t.boolean "nullifies_projectiles"
    t.index ["hero_id"], name: "index_abilities_on_hero_id"
  end

  create_table "api_keys", force: :cascade do |t|
    t.integer "bearer_id", null: false
    t.string "bearer_type", null: false
    t.string "token_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bearer_id", "bearer_type"], name: "index_api_keys_on_bearer_id_and_bearer_type"
    t.index ["token_digest"], name: "index_api_keys_on_token_digest", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "version"
    t.integer "heroes_per_team"
    t.datetime "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_tank", default: 2
    t.integer "role_support", default: 2
    t.integer "role_dps", default: 2
  end

  create_table "hard_counters", force: :cascade do |t|
    t.bigint "versus_hero_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hero_id"
    t.float "strength"
    t.index ["hero_id"], name: "index_hard_counters_on_hero_id"
    t.index ["versus_hero_id"], name: "index_hard_counters_on_versus_hero_id"
  end

  create_table "hero_teams", force: :cascade do |t|
    t.bigint "hero_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hero_id"], name: "index_hero_teams_on_hero_id"
    t.index ["team_id"], name: "index_hero_teams_on_team_id"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hp"
    t.integer "shield"
    t.integer "armor"
    t.boolean "aoe_heal", default: false
    t.boolean "has_escape_ability", default: false
    t.float "movement_speed", default: 5.5
    t.boolean "can_fly", default: false
    t.boolean "provides_damage_boost", default: false
    t.integer "cc_strength", default: 0
    t.bigint "game_id", null: false
    t.index ["game_id"], name: "index_heros_on_game_id"
    t.index ["role_id"], name: "index_heros_on_role_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_settings", force: :cascade do |t|
    t.string "name"
    t.string "encrypted_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "role_limit", default: true
    t.integer "hero_teams_count"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "confirmed_at", precision: nil
    t.string "confirmation_token"
    t.datetime "confirmation_sent_at", precision: nil
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "abilities", "heros"
  add_foreign_key "hard_counters", "heros", column: "versus_hero_id"
  add_foreign_key "hero_teams", "heros"
  add_foreign_key "hero_teams", "teams"
  add_foreign_key "heros", "games"
  add_foreign_key "heros", "roles"

  create_view "heros_by_primary_weapon_dps", sql_definition: <<-SQL
      SELECT heros.name
     FROM (heros
       LEFT JOIN abilities ON ((abilities.hero_id = heros.id)))
    ORDER BY abilities.fire_rate DESC;
  SQL
end
