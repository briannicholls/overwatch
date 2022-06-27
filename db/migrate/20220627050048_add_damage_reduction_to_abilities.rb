class AddDamageReductionToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_self_damage_reduction, :boolean, default: false
  end
end
