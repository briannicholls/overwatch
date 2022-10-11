class AddNullifiesProjectilesToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :nullifies_projectiles, :boolean
  end
end
