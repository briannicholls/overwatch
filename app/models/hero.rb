class Hero < ApplicationRecord
  belongs_to :role
  
  has_many :hard_counters, class_name: 'Hero', foreign_key: :advantage_hero_id
  belongs_to :advantage_hero, class_name: 'Hero', optional: true
end
