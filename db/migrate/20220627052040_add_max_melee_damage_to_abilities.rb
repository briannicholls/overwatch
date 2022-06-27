class AddMaxMeleeDamageToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :max_melee_damage, :integer
    rename_column :abilities, :melee_damage, :min_melee_damage
  end
end
