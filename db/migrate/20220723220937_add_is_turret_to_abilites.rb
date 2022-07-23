class AddIsTurretToAbilites < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :is_turret, :boolean, default: false
  end
end
