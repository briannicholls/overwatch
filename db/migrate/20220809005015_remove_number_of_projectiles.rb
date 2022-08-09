class RemoveNumberOfProjectiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :abilities, :number_of_projectiles
  end
end
