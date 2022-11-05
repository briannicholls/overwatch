class Ability < ApplicationRecord
  include Percentile # allows for calculation of percentile on qualifying attributes

  belongs_to :hero
  validates_presence_of :name #, :can_be_cancelled
  validates :projectiles_per_shot, :fire_rate, :max_damage_per_projectile, :min_damage_per_projectile, presence: true, if: lambda { self.is_projectile && self.deals_damage && !self.is_ultimate }

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
  scope :ultimates, ->() {where(is_ultimate: true)}
  scope :non_ultimates, ->() {where(is_ultimate: false)}
  scope :primary_fires, ->() {where(is_primary_fire: true)}
  scope :non_primary_fires, ->() {where(is_primary_fire: false)}
  scope :applies_invulnerability_any, ->() { where("'invulnerability'=ANY(aoe_effect_types) or applies_invulnerability_self = true") }



  def projectiles_fired_per_second
    if !read_attribute(:projectiles_fired_per_second)
      begin
        projectiles_per_shot * fire_rate
      rescue
        puts self.attributes
        super
      end
    else
      self.read_attribute(:projectiles_fired_per_second)
    end
  end

  def time_to_fire_full_magazine
    shots_before_reloading * fire_rate_db_value * 1000.0
  end

  def fire_rate
    fire_rate_db_value = self.read_attribute(:fire_rate)

    # if no fire rate specified, default to using cooldown timer,
    # or calculate rate from number of charges
    if !fire_rate_db_value
      calculated_fire_rate = 0
      if cooldown
        begin
          total_cooldown_delay = cooldown + cooldown_timer_delay
          1 / total_cooldown_delay
        rescue
          puts self.attributes.slice(:id,
            :cooldown,
            :cooldown_timer_delay          )
        end
      elsif charges
        calculated_fire_rate = charges + ( 1 / single_charge_regeneration_duration) 
      end

    else # if fire_rate is present, modify value to include reload time unless it is 0
      return fire_rate_db_value if ammo == -1 || reload_time == 0 || !ammo
      begin
        shots_before_reloading = ammo
        time_to_fire_full_magazine = (shots_before_reloading / fire_rate_db_value) * 1000.0
        time_to_empty_mag_and_reload = time_to_fire_full_magazine + reload_time
        adjusted_rate = shots_before_reloading / (time_to_empty_mag_and_reload / 1000.0)
        adjusted_rate
      rescue => e
        puts self.attributes.slice(
          :ammo,
          :projectiles_per_shot,
          :reload_time
        )
      end
    end


  end

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
  # TODO: convert this to SQL
  def dps
    [ total_damage_over_time, max_aoe_damage, max_beam_damage, max_projectile_dps, max_melee_dps]
    .compact.sum
  end

  def total_damage_over_time
    return 0 if !damage_over_time || !duration
    damage_over_time * (duration * 0.001)
  end

  def damage_per_shot
    return 0 if !deals_damage || !is_projectile
    raise "Null value error: projectiles_per_shot, max_damage_per_projectile for #{id} #{name}" if [projectiles_per_shot, max_damage_per_projectile].any?(&:nil?)
    projectiles_per_shot * max_damage_per_projectile
  end

  def can_one_shot_kill(hero)
    # consider head shot damage if applicable
    hero_total_health = hero.hp + hero.shield + hero.armor
    ( applies_headshot_damage && damage_per_shot * 2 >= hero_total_health ) ||
    damage_per_shot >= hero_total_health
  end

  # todo: this can be SQL
  def has_high_burst_damage
    threshold_percent = 80
    dps_values = Ability.damage_dealing.map(&:dps)
    percentile(dps, dps_values) > threshold_percent
  end

  private

  def average_beam_dps
    [base_beam_damage, max_beam_damage].sum / 2.0
  end

  def max_melee_dps
    return 0 unless max_melee_damage
    max_melee_damage * (fire_rate ? fire_rate : 1)
  end

  def max_projectile_dps
    return 0 if !deals_damage || !is_projectile || (is_ultimate && !fire_rate)
    begin
      max_damage_per_projectile * projectiles_per_shot * fire_rate
    rescue => e
      puts ""; puts "***************************";
      puts "#{hero.name}'s (#{hero.id}) ability \"#{name}\" (#{keybinding}) is missing one of the following attributes (ID #{id}):"
      puts "#{{max_damage_per_projectile: max_damage_per_projectile, projectiles_per_shot: projectiles_per_shot, fire_rate: fire_rate}.inspect}"
      puts "***************************"; puts "";
      raise e
    end
  end

  def percentile(score, scores_array)
    return 0 if !score
    begin
      number_of_values_below_score = scores_array.select{ |val| val < score }.length
      total_number_of_scores       = scores_array.length
      percentile                   = number_of_values_below_score.to_f / total_number_of_scores.to_f * 100.0
    rescue ArgumentError => e
      binding.pry
      raise "Incompatible values #{[score, scores_array]}.inspect}"
    end
  end
  
end
