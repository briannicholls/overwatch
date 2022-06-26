class AddIsPassiveToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :is_passive, :boolean, default: false
  end
end
