class AddGameToHeros < ActiveRecord::Migration[7.0]
  def change
    add_reference :heros, :game, null: false, foreign_key: true
  end
end
