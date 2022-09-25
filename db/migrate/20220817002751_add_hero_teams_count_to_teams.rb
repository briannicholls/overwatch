class AddHeroTeamsCountToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :hero_teams_count, :integer
  end
end
