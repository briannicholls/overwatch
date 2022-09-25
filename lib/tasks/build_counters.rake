# For each hero, compare against each other hero,
# creating a HardCounter for each, saving the strength
# of the counter with the join table hard_counters

desc "Creates counter relationship for all heros (takes a long time)"
task :build_counters => [:environment] do
  # HardCounter.delete_all
  ow1_heros = Hero.where game_id: 1
  # for each hero, compare against each other hero
  ow1_heros.shuffle.each do |hero|
    ow1_heros.shuffle.each do |test_hero|
      puts "Comparing #{hero.name} vs. #{test_hero.name}"
      hero.compare(test_hero)
    end
  end
end