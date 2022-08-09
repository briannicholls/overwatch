class AddAppliesHealingSelfToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_healing_self, :boolean
  end
end
