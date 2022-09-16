class RemoveColumnAppliesSelfMovementPenaltyFromAbilities < ActiveRecord::Migration[7.0]
  def change
    remove_column :abilities, :applies_self_movement_penalty
  end
end
