class Team < ApplicationRecord
  has_many :heros

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
end
