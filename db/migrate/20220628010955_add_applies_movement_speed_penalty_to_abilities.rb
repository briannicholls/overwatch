class AddAppliesMovementSpeedPenaltyToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_speed_penalty, :boolean, default: false
  end
end
