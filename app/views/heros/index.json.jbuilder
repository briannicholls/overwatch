# json.array! @heros, partial: "heros/hero", as: :hero
json.array! @heros do |hero|
  json.extract! hero, :id, :name, :role_name, :countered_by_heroes, :counters_heroes
end
