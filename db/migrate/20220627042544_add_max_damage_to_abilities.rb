class AddMaxDamageToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :min_damage_per_projectile, :float
    rename_column :abilities, :damage_per_projectile, :max_damage_per_projectile
  end
end
