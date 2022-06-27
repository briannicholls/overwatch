class AddMeleeDamageToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :melee_damage, :integer
  end
end
