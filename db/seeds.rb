# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

roles = [
  { name: 'Tank' },
  { name: 'DPS' },
  { name: 'Support' },
]
heroes = [
  # Tanks
  { name: 'D.Va', role_id: 1},
  { name: 'Orisa', role_id: 1},
  { name: 'Reinhardt', role_id: 1},
  { name: 'Roadhog', role_id: 1},
  { name: 'Sigma', role_id: 1},
  { name: 'Winston', role_id: 1},
  { name: 'Wrecking Ball', role_id: 1},
  { name: 'Zarya', role_id: 1},

  # DPS
  { name: 'Ashe', role_id: 2},
  { name: 'Bastion', role_id: 2},
  { name: 'Cassidy', role_id: 2},
  { name: 'Doomfist', role_id: 2},
  { name: 'Echo', role_id: 2},
  { name: 'Genji', role_id: 2},
  { name: 'Hanzo', role_id: 2},
  { name: 'Junkrat', role_id: 2},
  { name: 'Mei', role_id: 2},
  { name: 'Pharah', role_id: 2},
  { name: 'Reaper', role_id: 2},
  { name: 'Soldier: 76', role_id: 2},
  { name: 'Sombra', role_id: 2},
  { name: 'Symmetra', role_id: 2},
  { name: 'Torbjörn', role_id: 2},
  { name: 'Tracer', role_id: 2},
  { name: 'Widowmaker', role_id: 2},

  # Support
  { name: 'Ana', role_id: 3},
  { name: 'Baptiste', role_id: 3},
  { name: 'Brigitte', role_id: 3},
  { name: 'Lúcio', role_id: 3},
  { name: 'Mercy', role_id: 3},
  { name: 'Moira', role_id: 3},
  { name: 'Zenyatta', role_id: 3},
]

roles.each do |role|
  Role.find_or_create_by( role )
end

heroes.each do |hero|
  existing_hero = Hero.find_by(name: hero[:name])
  if !existing_hero
    Hero.create! hero
  end
end
