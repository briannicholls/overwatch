class AddAppliesArmorToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_armor, :boolean, default: false
  end
end
