class RemoveColumnsFromHeros < ActiveRecord::Migration[7.0]
  def change
    remove_column :heros, :can_heal_self
    remove_column :heros, :heal_self_strength
    remove_column :heros, :has_cc
    remove_column :heros, :shield_hp
    remove_column :heros, :cc_range
    remove_column :heros, :melee_primary_fire
    remove_column :heros, :aoe_primary
    remove_column :heros, :provides_shield
    remove_column :heros, :provides_speed_boost
    remove_column :heros, :provides_armor
    remove_column :heros, :is_hitscan
    remove_column :heros, :reload_time
    remove_column :heros, :has_secondary_fire
  end
end
