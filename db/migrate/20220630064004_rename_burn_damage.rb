class RenameBurnDamage < ActiveRecord::Migration[7.0]
  def change
    rename_column :abilities, :applies_burn, :applies_damage_over_time
    rename_column :abilities, :burn_damage_per_second, :damage_over_time
  end
end
