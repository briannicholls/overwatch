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

  # connects_to database: { writing: :abilities, reading: :abilities_replica }

  # return hero with the highest counter rating against this hero
  def strongest_counter
    hard_counters.order(strength: :desc).first
  end

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
    # TODO: when checking for .any abilities. if there are multiple, that should multiply strength bonus
    
    hero_hero = HardCounter.find_or_create_by(hero_id: id, versus_hero_id: test_hero.id)
    strength = 0   # my offensive strength against you

    # If this hero uses a beam weapon and other hero has no shield (if tank)
    strength += 1 if self.primary_fire.is_beam && !test_hero.has_barrier

    # If hero has a barrier but primary fire ignores it
    strength += 1 if self.primary_fire.ignores_barriers && test_hero.has_barrier

    # if hero can be one-shotted
    binding.pry
    strength += 1 if self.abilities.any?(&:can_one_shot(test_hero))

    # if I have CC and you have no escape move
    if self.abilities.any?(&:applies_stun) && !test_hero.has_escape_move
      strength += 1
    elsif self.abilities.any?(&:applies_stun) && !test_hero.abilities.any?(&:applies_stun)
      strength += 0.2
    end

    # if you have armor and my primary fire shoots many pellets
    strength -= 0.8 if test_hero.armor > 0 && self.primary_fire.projectiles_fired_per_second > 10

    # if I have CC and you have an ability with high ult cost (I can canel it)
    strength += 0.5 if self.abilities.any?(&:applies_stun) && test_hero.ultimate_cost_percentile > 80 && test_hero.ultimate_ability.can_be_cancelled

    hero_hero.update(strength: strength)

  end

  def has_barrier
    abilities.find_by(is_barrier: true).present?
  end
  
end
