class HardCounter < ApplicationRecord
  # belongs_to :hero
  belongs_to :versus_hero, class_name: 'Hero', foreign_key: :versus_hero_id
  belongs_to :disadvantage_hero, class_name: 'Hero', foreign_key: :hero_id # will always return own hero due to relationship in hard_counters. use hard_counters instead

  def rank_heros(hero_1, hero_2)
    # if a 
  end
  
end
