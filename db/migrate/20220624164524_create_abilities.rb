class CreateAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :abilities do |t|
      t.references :hero, null: false, foreign_key: true
      t.string :keybinding
      t.integer :cooldown
      t.integer :duration
      t.boolean :has_aoe_effect
      t.integer :aoe_effect_radius
      t.integer :hit_damage
      t.boolean :applies_burn
      t.boolean :applies_speed_boost
      t.boolean :applies_stun
      t.boolean :applies_shield
      t.integer :cast_time
      t.boolean :applies_headshot_damage
      t.integer :burn_damage_per_second
      t.boolean :is_projectile
      t.integer :projectile_speed
      t.integer :damage_per_projectile
      t.float :projectiles_fired_per_second
      t.float :max_range
      t.integer :hp
      t.boolean :is_ultimate
      t.integer :ultimate_cost

      t.timestamps
    end
  end
end
