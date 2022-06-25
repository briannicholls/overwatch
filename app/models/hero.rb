class Hero < ApplicationRecord
  belongs_to :role
  belongs_to :game
  has_many :hard_counters
  has_many :advantage_heros,    class_name: 'Hero', foreign_key: :advantage_hero_id, through: :hard_counters
  has_many :disadvantage_heros, class_name: 'Hero', foreign_key: :hero_id , through: :hard_counters
  has_many :abilities
  accepts_nested_attributes_for :hard_counters

  def advantage_hero_ids=(ids)
    ids.each do |id|
      HardCounter.find_or_create_by(hero_id: self.id, advantage_hero_id: id)
    end
  end

  # returns list of hero names that counter this hero
  def countered_by_heroes
    advantage_heros.pluck(:name)
  end

  # returns list of hero names that this hero counters
  def counters_heroes
    disadvantage_heros.pluck(:name)
  end

  def role_name
    role.name
  end
end
