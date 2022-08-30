class Hero < ApplicationRecord
  has_paper_trail
  
  belongs_to :role
  belongs_to :game

  has_many :hero_teams
  has_many :teams, through: :hero_teams

  has_many :hard_counters
  has_many :advantage_heros,    class_name: 'Hero', foreign_key: :advantage_hero_id, through: :hard_counters
  has_many :disadvantage_heros, class_name: 'Hero', foreign_key: :hero_id , through: :hard_counters
  
  has_many :abilities
  
  accepts_nested_attributes_for :hard_counters
  accepts_nested_attributes_for :abilities

  # validates

  def file_friendly_name
    name.downcase.underscore.gsub(/[\. ]/, '_')
  end

  def has_escape_move
    abilities.where(is_ultimate: false).any?(&:is_escape_move)
  end

  def max_dps_primary_fire
    primary_fire.dps
  end

  def get_advantage_heros
    Hero.all.select{ |hero| hero.is_advantage_hero(self) }
  end
  
  # return true if this hero instance counters given hero
  def is_advantage_hero(hero)
  end

  # create hard counters by ids
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

  def self.total_ultimate_cost
    sum(:ultimate_cost)
  end

  def ultimate_ability
    abilities.find_by is_ultimate: true
  end

  def primary_fire
    abilities.find_by is_primary_fire: true
  end

  def secondary_fire
    abilities.find_by is_secondary_fire: true
  end

  def ultimate_cost
    ultimate_ability.ultimate_cost
  end

  # todo: calculate an advantage hero based on several factors
  # and create/update counter relationship
  def compare(test_hero)
    hero_hero = HardCounter.find_or_create_by(advantage_hero_id: test_hero.id)

    # 1. If this hero uses a beam weapon and other hero has no shield (if tank)

  end
  
end
