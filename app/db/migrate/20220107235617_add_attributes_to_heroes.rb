class AddAttributesToHeroes < ActiveRecord::Migration[7.0]
  def change
    add_column :heros, :can_heal_self, :boolean, default: false
    add_column :heros, :heal_self_strength, :float
  end
end
