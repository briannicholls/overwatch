class RemoveHasShieldFromHeros < ActiveRecord::Migration[7.0]
  def change
    remove_column :heros, :has_shield
  end
end
