class AddHeroIdToHardCounters < ActiveRecord::Migration[7.0]
  def change
    change_table :hard_counters do |t|
      t.references :hero
    end
  end
end
