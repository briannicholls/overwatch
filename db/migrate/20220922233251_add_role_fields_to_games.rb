class AddRoleFieldsToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :role_tank, :integer, default: 2
    add_column :games, :role_support, :integer, default: 2
    add_column :games, :role_dps, :integer, default: 2
  end
end
