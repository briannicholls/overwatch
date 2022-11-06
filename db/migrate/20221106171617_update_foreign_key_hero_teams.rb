class UpdateForeignKeyHeroTeams < ActiveRecord::Migration[7.0]
  def change
    # remove the old foreign_key
    remove_foreign_key :hero_teams, :teams

    # add the new foreign_key
    add_foreign_key :hero_teams, :teams, on_delete: :cascade
  end
end
