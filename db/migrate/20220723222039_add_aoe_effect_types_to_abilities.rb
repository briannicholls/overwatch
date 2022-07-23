class AddAoeEffectTypesToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :aoe_effect_types, :text, array: true, default: []
  end
end
