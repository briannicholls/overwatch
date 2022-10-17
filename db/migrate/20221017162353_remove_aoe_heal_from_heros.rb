class RemoveAoeHealFromHeros < ActiveRecord::Migration[7.0]
  def change
    remove_column :heros, :aoe_heal
  end
end
