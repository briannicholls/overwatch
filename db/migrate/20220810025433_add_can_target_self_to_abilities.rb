class AddCanTargetSelfToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :can_target_self, :boolean
  end
end
