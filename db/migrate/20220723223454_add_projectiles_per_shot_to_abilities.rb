class AddProjectilesPerShotToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :projectiles_per_shot, :float
  end
end
