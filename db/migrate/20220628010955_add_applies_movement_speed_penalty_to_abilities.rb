class AddAppliesMovementSpeedPenaltyToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_speed_penalty_self, :boolean, default: false
    add_column :abilities, :applies_speed_penalty_enemy, :boolean, default: false
  end
end
