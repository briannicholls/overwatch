class HardCounter < ApplicationRecord
  # belongs_to :hero
  belongs_to :versus_hero, class_name: 'Hero', foreign_key: :versus_hero_id
  belongs_to :hero, class_name: 'Hero', foreign_key: :hero_id # will always return own hero due to relationship in hard_counters. use hard_counters instead

  # compare hero against versus_hero and assign strength value
  def calculate_strength
    result = 0

    oneshot_headshot = versus_hero.primary_fire.can_one_shot_kill(versus_hero)



    # check for existence of escape moves (both chars, i.e. for chasing)

    #

    # cc modifiers for each hero

  end

  # returns milliseconds of time to kill hero with primary fire
  def time_to_kill
    # todo: calculate armor dmg per shot
    total_hp = versus_hero.hp + versus_hero.shield
    hero.primary_fire.dps / total_hp
    # hp, dps
  end
  
end
