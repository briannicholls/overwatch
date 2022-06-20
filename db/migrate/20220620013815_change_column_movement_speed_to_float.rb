class ChangeColumnMovementSpeedToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :heros, :movement_speed, :float, default: 5.5
  end
end
