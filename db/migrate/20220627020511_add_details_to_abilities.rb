class AddDetailsToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :applies_self_movement_penalty, :boolean, default: false
  end
end
