class AddNumberOfProjectilesToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :number_of_projectiles, :integer
  end
end
