class AddHasCcToHeros < ActiveRecord::Migration[7.0]
  def change
    add_column :heros, :has_cc, :boolean, default: false
  end
end
