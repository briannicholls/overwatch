class AddIsHitscanToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :is_hitscan, :boolean, default: false
  end
end
