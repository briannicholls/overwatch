class Ability < ApplicationRecord
  belongs_to :hero

  validates_presence_of :name

  # Damage per second. For non-primary fire, returns DPS for the duration they are active.
  def dps
    if is_projectile
      calculate_max_projectile_dps
    elsif is_beam
      max_beam_damage
    end
  end

  private

  def average_beam_dps
    [base_beam_damage, max_beam_damage].sum / 2.0
  end

  def calculate_max_projectile_dps
    max_damage_per_projectile * projectiles_per_shot * fire_rate
  end
  
end
