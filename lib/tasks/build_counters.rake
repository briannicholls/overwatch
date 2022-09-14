# For each hero, compare against each other hero,
# creating a HardCounter for each, saving the strength
# of the counter with the join table hard_counters

desc "Creates counter relationship for all heros (takes a long time)"
task :build_counters do
  ow1_heros = Hero.where game_id: 1

  ow1_heros do |hero|
    ow1_heros do |test_hero|

      hero.compare(test_hero)

    end
  end
end