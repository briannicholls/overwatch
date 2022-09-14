class Ability < ApplicationRecord
  belongs_to :hero

  validates_presence_of :name

  # connects_to database: { writing: :abilities, reading: :abilities_replica }

  # return abilities that do any damage
  scope :damage_dealing, ->() { where(
    <<-SQL
      damage_over_time >= 0 or
      max_aoe_damage >= 0 or
      max_beam_damage >= 0 or
      max_damage_per_projectile >= 0 or
      max_melee_damage >= 0
    SQL
  ) }
  scope :non_ultimates, ->() {where(is_ultimate: false)}

  # instance method version of scope method damage_dealing
  def deals_damage
      [
        damage_over_time,
        max_aoe_damage,
        max_beam_damage,
        max_damage_per_projectile,
        max_melee_damage
      ]
      .compact # remove nil values
      .any?{|x| x > 0}
  end

  def is_escape_move
    applies_speed_boost_self && applies_invulnerability_self
  end

  # Damage per second. For non-primary fire, returns DPS for the duration they are active.
  def dps
    [damage_over_time, max_aoe_damage, max_beam_damage, max_projectile_dps, max_melee_dps]
    .compact.sum
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

  def max_melee_dps
    return 0 unless max_melee_damage
    max_melee_damage * fire_rate
  end

  def max_projectile_dps
    return 0 if !deals_damage || !is_projectile
    begin
      max_damage_per_projectile * projectiles_per_shot * fire_rate
    rescue => e
      puts ""; puts "***************************";
      puts "#{hero.name}'s ability \"#{name}\" (#{keybinding}) is missing one of the following attributes (ID #{id}):"
      puts "#{{max_damage_per_projectile: max_damage_per_projectile, projectiles_per_shot: projectiles_per_shot, fire_rate: fire_rate}.inspect}"
      puts "***************************"; puts "";
      raise e
    end
  end
  
end
