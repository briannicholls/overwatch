class AddStrengthToHardCounters < ActiveRecord::Migration[7.0]
  def change
    add_column :hard_counters, :strength, :float
  end
end
