# json.extract! team, 
#   :id
json.team_id team.id
json.heros team.heros,
  :id,
  :name,
  :role_name,
  :hp,
  :shield,
  :armor,
  :ultimate_cost
json.counter_composition do
  json.heroes team.optimal_counter_composition,
    :id,
    :name,
    :role_name,
    :hp,
    :shield,
    :armor,
    :ultimate_cost
  json.url team_url(team, format: :json)
end

