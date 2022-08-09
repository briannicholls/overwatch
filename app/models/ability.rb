class Ability < ApplicationRecord
  belongs_to :hero

  validates_presence_of :name

  # Damage per second. For non-primary fire, returns DPS for the duration they are active.
  def dps
    if is_projectile
      calculate_projectile_dps
    elsif is_beam
      calculate_beam_dps
    end
  end

  private

  def calculate_beam_dps
    [base_beam_damage, max_beam_damage].sum / 2.0
  end

  def calculate_projectile_dps
    
  end
  
end
