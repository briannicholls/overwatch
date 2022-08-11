class Team < ApplicationRecord
  has_many :hero_teams
  has_many :heros, through: :hero_teams

  accepts_nested_attributes_for :heros

  def total_ultimate_cost
    heros
    .joins(:abilities)
    .sum(:ultimate_cost)
  end

  def total_barrier_hp
  end

  def total_damage_per_second
  end

  def count_heroes_with_cc
  end

  def total_hp
  end

  def standard_comp
    # todo
  end

  # returns Team of Heroes that counter this team
  def optimal_counter_composition

    # get counters for each hero
    # array of arrays
    all_hero_counters = heros.map(&:advantage_heros)
    

    # sample the hero counters and return a Team

    # TEMP: remove
    return Hero.all.slice(0,6)
    
  end
  
end
