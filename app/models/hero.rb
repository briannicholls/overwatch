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

  def has_primary_fire
    abilities.any?(&:is_primary_fire)
  end

  def strongest_counters(role=nil, limit=6)

  end

  # return hero with the highest counter rating against this hero
  def strongest_counter(role_name=nil, hero_ids_to_exclude=[])
    counters_by_strength_desc = hard_counters.where.not(versus_hero_id: [id, *hero_ids_to_exclude]).order(strength: :desc)
    if role_name
      role = Role.where('lower(name) = ?', role_name.to_s).first
      if role
        hero_ids_of_role = Hero.where(role_id: role.id).pluck(:id)
        counters_by_strength_desc = counters_by_strength_desc.where(versus_hero_id: hero_ids_of_role)
      end
    end

    if counters_by_strength_desc.present?
      counters_by_strength_desc.first.versus_hero
    else
      self
    end
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

  def counters_heroes
    hard_counters.where('strength > 0')
      .order(strength: :desc)
      .map(&:versus_hero)
      .map(&:name)
  end

  # returns list of hero names that counter this hero
  def countered_by_heroes
    countering_hero_ids = HardCounter.where(versus_hero_id: id)
      .where('strength > 0')
      .order(strength: :desc)
      .pluck(:hero_id)
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

  # calculate counter relationship between two heroes
  # creates or updates HardCounter (hero-hero join relationship)
  def compare(test_hero)
    # TODO: when checking for .any abilities. if there are multiple, that should multiply strength bonus
    # TODO: when ability affecting the calculation is an ultimate, perhaps scale it less
    
    # test pharah:
    # if test_hero.id == 15
    #   binding.pry
    # end

    hero_hero = HardCounter.find_or_create_by(hero_id: id, versus_hero_id: test_hero.id)
    strength = 0   # my offensive strength against you

    my_primary_fire = self.primary_fire
    # test_hero.primary_fire

    raise "Hero #{name} has no primary fire!" if !my_primary_fire

    test_hero_has_barrier = test_hero.has_barrier
    i_have_cc             = self.abilities.any?(&:applies_stun)

    # If this hero uses a beam weapon and other hero has no shield (if tank)
    strength += 1 if my_primary_fire.is_beam && !test_hero_has_barrier

    # If hero has a barrier but primary fire ignores it
    strength += 1 if my_primary_fire.ignores_barriers && test_hero_has_barrier

    # if hero can be one-shotted
    strength += 0.8 if primary_fire.can_one_shot_kill(test_hero)

    # if I have CC and you have no escape move
    if i_have_cc && !test_hero.has_escape_move
      strength += 0.7
    elsif i_have_cc && !test_hero.abilities.any?(&:applies_stun)
      strength += 0.2
    end

    # if you have armor and my primary fire shoots many pellets
    strength -= 0.8 if test_hero.armor > 0 && my_primary_fire.is_projectile && my_primary_fire.projectiles_fired_per_second > 10
    
    # Percentile = (number of values below score) ÷ (total number of scores) x 100 = (7) ÷ (42) x 100 = 0.17 x 100 = 17
    test_hero_ult_cost_percentile = test_hero.ultimate_ability.ultimate_cost_percentile
    # if I have CC and you have an ability with high ult cost (I can canel it)
    strength += 0.5 if i_have_cc && 
      test_hero.ultimate_ability.can_be_cancelled && 
      test_hero_ult_cost_percentile > 80

    # if your primary fire (or other abilities) give you a movement speed penalty,
    # and I am in 80th percentile p.f. range or damage per shot
    if test_hero.primary_fire.applies_speed_penalty_self && (
      abilities.any?(&:has_high_burst_damage)
    )
      strength += 0.5
    end
    
    # if I have invulnerability and you have an ability with high burst damage
    if test_hero.abilities.any?(&:has_high_burst_damage)
      # TODO: scale with duration and AOE application (multiple targets)
      if abilities.any?(&:aoe_effect_types)
        strength += 0.6
      elsif abilities.any?(&:applies_invulnerability_self)
        strength += 0.4
      end
    end

    # if you can fly and I can snipe u
    if test_hero.can_fly && (
      (primary_fire.max_range_percentile > 80 || primary_fire.max_range == -1 ) &&
      (primary_fire.projectile_speed == -1 || primary_fire.is_hitscan)
    )
      # scale with dps
      strength += 1 + (primary_fire.dps_percentile / 100)
    end

    hero_hero.update(strength: strength)

  end

  # todo: refactor into general _percentile method
  def percentile(score, scores_array) 
    number_of_values_below_score = scores_array.select{ |val| val < score }.length
    total_number_of_scores       = scores_array.length
    percentile                   = (number_of_values_below_score.to_f) / (total_number_of_scores.to_f) * 100.0
  end

  def has_barrier
    abilities.find_by(is_barrier: true).present?
  end
  
end
