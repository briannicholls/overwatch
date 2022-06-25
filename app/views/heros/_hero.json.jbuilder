json.extract! hero, 
  :id,
  :name,
  :role_name,
  :countered_by_heroes,
  :counters_heroes,
  :hp,
  :shield,
  :armor,
  :ultimate_cost

json.url hero_url(hero, format: :json)
