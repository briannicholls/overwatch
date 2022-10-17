class RemoveFurtherColumnsFromHeros < ActiveRecord::Migration[7.0]
  def change
    remove_column :heros, :cc_strength
    remove_column :heros, :provides_damage_boost
  end
end
