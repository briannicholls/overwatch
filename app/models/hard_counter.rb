class HardCounter < ApplicationRecord
  # belongs_to :hero
  belongs_to :advantage_hero, class_name: 'Hero', foreign_key: :advantage_hero_id
  belongs_to :disadvantage_hero, class_name: 'Hero', foreign_key: :hero_id # will always return own hero due to relationship in hard_counters. use hard_counters instead
end
