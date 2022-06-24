hero_names = [
  "Zenyatta",
  "Moira",
  "Mercy",
  "Lúcio",
  "Brigitte",
  "Baptiste",
  "Ana",
  "Roadhog",
  "Bastion",
  "Mei",
  "Reaper",
  "Soldier: 76",
]
[
  {
    name: "D.Va",
    role_id: 1,
    can_heal_self: false,
    heal_self_strength: nil,
    has_cc: true,
    # cc_strength: ,
    hp: 600,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    cc_range: 0,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: true,
    provides_shield: true,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: true
  },
  {
    name: "Orisa",
    role_id: 1,
    can_heal_self: false,
    heal_self_strength: nil,
    has_cc: false,
    # cc_strength: ,
    # cc_range: 0,
    hp: 200,
    shield: 0,
    armor: 250,
    has_shield: true,
    shield_hp: 600,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: false,
    # movement_speed: 
    can_fly: false,
    provides_shield: true,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Reinhardt",
    role_id: 1,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: ,
    # cc_range: 0,
    hp: 500,
    shield: 0,
    armor: 0,
    has_shield: true,
    shield_hp: 1500,
    melee_primary_fire: true,
    aoe_heal: false,
    aoe_primary: true,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: false,
    provides_shield: true,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Sigma",
    role_id: 1,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: true,
    cc_strength: 800, # milliseconds duration
    cc_range: 25, # meters
    hp: 300,
    shield: 100,
    armor: 0,
    has_shield: true,
    shield_hp: 700,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: false,
    # movement_speed: 
    can_fly: false,
    provides_shield: true,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Winston",
    role_id: 1,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 350,
    shield: 0,
    armor: 150,
    has_shield: true,
    shield_hp: 700,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: true,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: false,
    provides_shield: true,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Wrecking Ball",
    role_id: 1,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: true,
    cc_strength: 500, # milliseconds duration
    cc_range: 2, # meters
    hp: 500,
    shield: 0,
    armor: 100,
    has_shield: true,
    shield_hp: 100,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: true,
    movement_speed: 10,
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: true
  },
  {
    name: "Zarya",
    role_id: 1,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 200,
    shield: 200,
    armor: 0,
    has_shield: true,
    shield_hp: 200,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: false,
    # movement_speed: 
    can_fly: false,
    provides_shield: true,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: true
  },
  {
    name: "Ashe",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 200,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: false,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: true
  },
  {
    name: "Cassidy",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: true,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 225,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: false,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: true
  },
  {
    name: "Doomfist",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: true,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 250,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Echo",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 200,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: true,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Genji",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 200,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Hanzo",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 200,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: false,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Junkrat",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: true,
    cc_strength: 3000, # milliseconds duration
    cc_range: 0, # meters
    hp: 200,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Pharah",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 200,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: true,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: true,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Sombra",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 200,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: true
  },
  {
    name: "Symmetra",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: true,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 100,
    shield: 125,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: false,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: true,
    has_secondary_fire: true
  },
  {
    name: "Torbjörn",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 200,
    shield: 0,
    armor: 50,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: false,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
  {
    name: "Tracer",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 150,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: true
  },
  {
    name: "Widowmaker",
    role_id: 2,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 175,
    shield: 0,
    armor: 0,
    has_shield: false,
    shield_hp: 0,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: false,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: false,
    provides_shield: false,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: true
  },
  {
    name: "Winston",
    role_id: 1,
    can_heal_self: false,
    # heal_self_strength: nil,
    has_cc: false,
    # cc_strength: 800, # milliseconds duration
    # cc_range: 25, # meters
    hp: 350,
    shield: 150,
    armor: 0,
    has_shield: true,
    shield_hp: 700,
    melee_primary_fire: false,
    aoe_heal: false,
    aoe_primary: true,
    has_escape_ability: true,
    # movement_speed: 
    can_fly: false,
    provides_shield: true,
    provides_damage_boost: false,
    provides_speed_boost: false,
    provides_armor: false,
    is_hitscan: false
  },
]
