class Ability < ApplicationRecord
  belongs_to :hero

  validates_presence_of :name

  # return abilities that do any damage
  scope :damage_dealing, ->() { where(
    <<-SQL
      damage_over_time >= 0 and
      max_aoe_damage >= 0 and
      max_beam_damage >= 0 and
      max_damage_per_projectile >= 0 and
      max_melee_damage >= 0
    SQL
    ) }

  def deals_damage
    [damage_over_time, max_aoe_damage, max_beam_damage, max_damage_per_projectile, max_melee_damage].any?{|x| x > 0}
  end

  def is_escape_move
    applies_speed_boost_self && applies_invulnerability_self
  end

  # Damage per second. For non-primary fire, returns DPS for the duration they are active.
  def dps
    [damage_over_time, max_aoe_damage, max_beam_damage, max_projectile_dps, max_melee_damage].sum
    # if is_projectile
    #   calculate_max_projectile_dps
    # elsif is_beam
    #   max_beam_damage
    # end
  end

  def damage_per_shot
    projectiles_per_shot * max_damage_per_projectile
  end

  def can_one_shot_kill(hero)
    # consider head shot damage if applicable
    hero_total_health = hero.hp + hero.shield + hero.armor
    ( applies_headshot_damage && damage_per_shot * 2 >= hero_total_health ) ||
    damage_per_shot >= hero_total_health
  end

  private

  def average_beam_dps
    [base_beam_damage, max_beam_damage].sum / 2.0
  end

  def max_projectile_dps
    return 0 if is_beam || !deals_damage
    begin
      max_damage_per_projectile * projectiles_per_shot * fire_rate
    rescue NoMethodError
      puts ""
      puts "*************************"
      puts "#{hero.name}'s ability \"#{name}\" is missing one of the following attributes: max_damage_per_projectile, projectiles_per_shot, fire_rate"
      puts "#{{max_damage_per_projectile: max_damage_per_projectile, projectiles_per_shot: projectiles_per_shot, fire_rate: fire_rate}.inspect}"
      puts "*************************"
      puts ""
      throw NoMethodError
    end
  end
  
end
