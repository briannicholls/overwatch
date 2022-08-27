class Team < ApplicationRecord
  has_many :hero_teams, dependent: :destroy
  has_many :heros, through: :hero_teams

  accepts_nested_attributes_for :hero_teams
  accepts_nested_attributes_for :heros

  # TODO: with_hero (singular)
  # scope :with_heros, -> (hero_ids) { joins(:hero_teams).where('hero_teams.hero_id in (?)',  hero_ids).group('teams.id') }
  scope :with_exact_heros, -> (hero_ids) { joins(:hero_teams).where('hero_teams.hero_id in (?)',  hero_ids).group('teams.id').count('hero_teams.hero_id') }
  
  # ToDo: fix this. it will always return a team no matter what. fix hero id filters
  def self.first_or_create_by_heros(hero_ids)
    team_size = Hero.find(hero_ids[0]).game.heroes_per_team
    map_team_id_to_hero_count = with_exact_heros(hero_ids)
    .select{ |team_id, hero_count| hero_count == team_size }
    if map_team_id_to_hero_count.present?
      Team.find(map_team_id_to_hero_count.keys.first)
    else
      Team.create(hero_ids: hero_ids)
    end
  end
  
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
    
# binding.pry

    # sample the hero counters and return a Team

    # TEMP: remove
    return Hero.all.slice(0,6)
  end
  
end
