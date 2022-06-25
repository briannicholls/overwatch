class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :version
      t.integer :heroes_per_team
      t.datetime :release_date

      t.timestamps
    end
  end
end
