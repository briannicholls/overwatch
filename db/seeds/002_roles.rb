roles = [
  { name: 'Tank' },
  { name: 'DPS' },
  { name: 'Support' },
]
roles.each do |role|
  Role.find_or_create_by( name: role[:name] )
end
