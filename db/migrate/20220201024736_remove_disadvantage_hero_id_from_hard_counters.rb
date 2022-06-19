class RemoveDisadvantageHeroIdFromHardCounters < ActiveRecord::Migration[7.0]
  def change
    remove_column :hard_counters, :disadvantage_hero_id
  end
end
