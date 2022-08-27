class RenameColumnAdvantageHeroIdToVersusHeroId < ActiveRecord::Migration[7.0]
  def change
    rename_column :hard_counters, :advantage_hero_id, :versus_hero_id
  end
end
