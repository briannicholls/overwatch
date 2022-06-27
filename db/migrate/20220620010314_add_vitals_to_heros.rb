class AddVitalsToHeros < ActiveRecord::Migration[7.0]
  def change
    add_column :heros, :hp, :integer
    add_column :heros, :shield, :integer
    add_column :heros, :armor, :integer
    add_column :heros, :has_shield, :boolean, default: false
    add_column :heros, :shield_hp, :integer
    add_column :heros, :melee_primary_fire, :boolean, default: false
    add_column :heros, :cc_range, :integer
    add_column :heros, :aoe_heal, :boolean, default: false
    add_column :heros, :aoe_primary, :boolean, default: false
    add_column :heros, :has_escape_ability, :boolean, default: false
    add_column :heros, :movement_speed, :float
    add_column :heros, :can_fly, :boolean, default: false
    add_column :heros, :provides_shield, :boolean, default: false
    add_column :heros, :provides_damage_boost, :boolean, default: false
    add_column :heros, :provides_speed_boost, :boolean, default: false
    add_column :heros, :provides_armor, :boolean, default: false
    add_column :heros, :is_hitscan, :boolean, default: false
  end
end
