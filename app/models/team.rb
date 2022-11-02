class Team < ApplicationRecord
  has_many :hero_teams, dependent: :destroy
  has_many :heros, through: :hero_teams

  accepts_nested_attributes_for :hero_teams
  accepts_nested_attributes_for :heros

  # TODO: with_hero (singular)
  # scope :with_heros, -> (hero_ids) { joins(:hero_teams).where('hero_teams.hero_id in (?)',  hero_ids).group('teams.id') }
  scope :with_exact_heros, -> (hero_ids) { joins(:hero_teams).where('hero_teams.hero_id in (?)',  hero_ids).group('teams.id').count('hero_teams.hero_id') }

  validates :hero_teams, length: { minimum: 5, maximum: 5 }
  
  # ToDo: fix this. it will always return a team no matter what. fix hero id filters
  def self.first_or_create_by_heros(hero_ids)
    # team_size = Hero.find(hero_ids[0]).game.heroes_per_team
    team_size = 5
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
  def optimal_counter_composition(observe_roles=true)
    heros_by_role = {
      dps:     [],
      tank:    [],
      support: [],
    }
    # game = heros.first.game
    role_counts = {
      dps:     2,
      tank:    1,
      support: 2
    }
    # First add the strongest counters, and continue to add unique heroes after that
    strongest_hero_counters = heros.map(&:strongest_counter).uniq

    # For each strongest hero, add them as long as role is not full
    strongest_hero_counters.each do |hero|
      role_name = hero.role.name.downcase
      heros_by_role[role_name.to_sym].push hero #unless heros_by_role[role_name.to_sym].length == hero.game.send("role_#{role_name}")
    end

    # for the remaining slots, add the strongest hero of that role
    heros_by_role.each do |role_name, val_array|
      heros_needed = role_counts[role_name] - val_array.length
      if heros_needed > 0
        new_heros_to_add = []
        strongest_counters_of_role = heros.map do |hero|
          new_hero = hero.strongest_counter(role_name)
          if new_heros_to_add.any?{|h| h.id == new_hero.id}
            new_hero = hero.strongest_counter(role_name, new_heros_to_add.map(&:id))
            new_heros_to_add.push(new_hero)
          else
            new_heros_to_add.push(new_hero)
          end
        end
        
        heros_needed.times do |i|
          heros_by_role[role_name.to_sym].push(strongest_counters_of_role.flatten[i])
        end
      end
    end

    return heros_by_role.values.uniq.flatten.compact
  end
  
end
