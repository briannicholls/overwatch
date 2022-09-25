# json.array! @heros, partial: "heros/hero", as: :hero
json.array! @heros, 
  :id,
  :name,
  :role_name,
  :hp,
  :shield,
  :armor
