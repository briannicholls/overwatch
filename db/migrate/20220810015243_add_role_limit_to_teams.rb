class AddRoleLimitToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :role_limit, :boolean, default: true
  end
end
