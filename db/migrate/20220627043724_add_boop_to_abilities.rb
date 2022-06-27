class AddBoopToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_boop, :boolean, default: false
    add_column :abilities, :boop_distance, :float
  end
end
