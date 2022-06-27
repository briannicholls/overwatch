class AddAppliesDamageBoostToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_damage_boost, :boolean
    add_column :abilities, :percent_damage_reduction_self, :float
    add_column :abilities, :percent_damage_boost_self, :float
    add_column :abilities, :percent_damage_boost_aoe, :float
  end
end
