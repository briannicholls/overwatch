class HardCounter < ApplicationRecord
  belongs_to :advantage_hero, class_name: 'Hero', foreign_key: :advantage_hero_id
  belongs_to :disadvantage_hero, class_name: 'Hero', foreign_key: :disadvantage_hero_id
end
