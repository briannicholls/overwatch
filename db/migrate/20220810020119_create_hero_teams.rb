class CreateHeroTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :hero_teams do |t|
      t.references :hero, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
