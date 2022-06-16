class Hero < ApplicationRecord
  belongs_to :role
  
  has_many :hard_counters
  has_many :advantage_heros,    class_name: 'Hero', foreign_key: :advantage_hero_id, through: :hard_counters
  has_many :disadvantage_heros, class_name: 'Hero', foreign_key: :hero_id , through: :hard_counters

  accepts_nested_attributes_for :hard_counters

  DVA = Hero.find(7)
  MEI = Hero.find(23)
  
end
