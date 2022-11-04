# For each hero, compare against each other hero,
# creating a HardCounter for each, saving the strength
# of the counter with the join table hard_counters

desc "Creates counter relationship for all heros (takes a long time)"
task :build_counters => [:environment] do
  all_heroes = Hero.all.order(:created_at => :desc)
  # for each hero, compare against each other hero
  all_heroes.shuffle.each do |hero|
    all_heroes.shuffle.each do |test_hero|
      puts "Comparing #{hero.name} vs. #{test_hero.name}"
      hero.compare(test_hero)
    end
  end
end