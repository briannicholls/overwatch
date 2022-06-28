class ChangeBoopDistanceToMaxAndMin < ActiveRecord::Migration[7.0]
  def change
    rename_column :abilities, :boop_distance, :max_boop_distance
    add_column :abilities, :min_boop_distance, :float
  end
end
