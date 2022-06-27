class AddIsPrimaryFireToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :is_primary_fire, :boolean
  end
end
