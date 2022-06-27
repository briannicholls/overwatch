class AddCcStrengthToHeros < ActiveRecord::Migration[7.0]
  def change
    add_column :heros, :cc_strength, :integer, default: 0
  end
end
