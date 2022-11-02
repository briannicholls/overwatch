class RemoveGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :heros, :game_id
    drop_table :games
  end
end
