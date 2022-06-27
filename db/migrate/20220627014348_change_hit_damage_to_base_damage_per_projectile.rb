class ChangeHitDamageToBaseDamagePerProjectile < ActiveRecord::Migration[7.0]
  def change
    rename_column :abilities, :hit_damage, :base_beam_damage
    add_column :abilities, :is_beam, :boolean, default: false
    add_column :abilities, :max_beam_damage, :integer
    add_column :abilities, :reload_time, :integer
    add_column :abilities, :fire_rate, :float
    add_column :abilities, :beam_width, :float
    change_column :abilities, :projectile_speed, :float
  end
end
