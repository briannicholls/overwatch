class AddAoeDamageToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :max_aoe_damage, :integer
    add_column :abilities, :min_aoe_damage, :integer
  end
end
