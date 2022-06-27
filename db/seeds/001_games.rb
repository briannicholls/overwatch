games = [
  { name: 'Overwatch' },
  { name: 'Overwatch 2' }
]

games.each do |game|
  Game.find_or_create_by(name: game[:name])
end