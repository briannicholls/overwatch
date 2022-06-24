class AddDetailsToHeroes < ActiveRecord::Migration[7.0]
  def change
    add_column :heros, :reload_time, :integer
    add_column :heros, :has_secondary_fire, :boolean, default: false
  end
end
