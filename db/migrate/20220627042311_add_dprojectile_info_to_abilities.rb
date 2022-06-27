class AddDprojectileInfoToAbilities < ActiveRecord::Migration[7.0]
  def change
    add_column :abilities, :initial_falloff_distance, :float
    add_column :abilities, :spread_angle, :float
    add_column :abilities, :final_falloff_disance, :float
  end
end
