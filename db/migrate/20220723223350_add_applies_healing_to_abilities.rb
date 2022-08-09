class AddAppliesHealingToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_healing, :boolean, default: false
  end
end
