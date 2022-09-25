json.extract! hero, 
  :id,
  :name,
  :role_name,
  :hp,
  :shield,
  :armor,
  :ultimate_cost

json.url hero_url(hero, format: :json)
