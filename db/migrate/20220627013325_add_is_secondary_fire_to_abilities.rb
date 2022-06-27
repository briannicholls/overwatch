class AddIsSecondaryFireToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :is_secondary_fire, :boolean, default: false
  end
end
