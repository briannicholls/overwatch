class AddCanBeCancelledToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :can_be_cancelled, :boolean, default: false
  end
end
