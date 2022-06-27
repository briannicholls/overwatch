class AddNameToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :name, :string
  end
end
