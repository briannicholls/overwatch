class AddArmorProvidedToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :armor_provided, :integer
  end
end
