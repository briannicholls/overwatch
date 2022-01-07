class AddAttributesToHeroes < ActiveRecord::Migration[7.0]
  def change
    add_column :heroes, :can_heal_self, :boolean, default: false
    add_column :heroes, :heal_self_strength, :float
  end
end
