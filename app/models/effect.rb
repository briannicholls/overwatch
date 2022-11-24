class Effect < ApplicationRecord
  belongs_to :ability

  EFFECT_TYPES = [
    'damage',
    'damage_over_time',
    'damage_boost',
    'damage_reduction',
    'healing',
    'healing_over_time',
    'movement_speed_boost',
    'movement_speed_penalty',
    'invulnerability',
    'fire_rate_boost',
    'stun',
    'root'
  ].freeze

  TARGETS = [
    'self',
    'targeted',
    'aoe',
    'aim'
  ]

  validates :effect_type, presence: true, inclusion: { in: EFFECT_TYPES }
  validates :target, presence: true, inclusion: { in: TARGETS }
end
