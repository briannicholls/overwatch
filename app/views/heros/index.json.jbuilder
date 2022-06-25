# json.array! @heros, partial: "heros/hero", as: :hero
json.array! @heros, 
  :id,
  :name,
  :role_name,
  :countered_by_heroes,
  :counters_heroes,
  :hp,
  :shield,
  :armor
