class RemoveAdvantageHeroIdFromHeros < ActiveRecord::Migration[7.0]
  def change
    remove_column :heros, :advantage_hero_id
  end
end
