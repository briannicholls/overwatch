namespace :db do

  desc "Re-build counters then update DB and copy to test environment"
  task :recalc => [:environment] do
    start_time = Time.now
    # puts "Preparing Test DB"
    # Rake::Task["db:prepare"].execute
    Rake::Task["build_counters"].execute
    puts "Finished building counters in #{(Time.now - start_time).seconds.round(2)}s"
    Rake::Task["db:copy_db"].execute
    puts "Time elapsed: #{(Time.now - start_time).seconds.round(2)}s"
  end

  # TODO: make below work for production_clone DB from heroku pg:pull
  desc "Destroy test DB and replace with values from development DB"
  task :copy_db => [:environment] do
    return if Rails.env != 'development'

    # ActiveRecord::Base.establish_connection :development
    game_attributes    = Game.all.map(&:attributes)
    role_attributes    = Role.all.map(&:attributes)
    hero_attributes    = Hero.all.map(&:attributes)
    ability_attributes = Ability.all.map(&:attributes)
    hard_counters      = HardCounter.all.map(&:attributes)
    # hero_teams         = HeroTeam.all.map(&:attributes)
    
    
    ActiveRecord::Base.establish_connection :test

    # Remove existing data before inserting new data
    HardCounter.delete_all
    Ability.delete_all
    Hero.delete_all
    Game.delete_all
    Role.delete_all
    
    # insert data from development DB
    game_attributes.each do |ability|
      Game.new(ability).save! # using save! will overwrite ID
    end
    role_attributes.each do |ability|
      Role.new(ability).save!
    end
    hero_attributes.each do |hero|
      puts "Updating Hero: #{hero['name']}"
      Hero.new(hero).save!
    end
    ability_attributes.each do |ability|
      puts "Updating Ability: #{ability['name']}"
      Ability.new(ability).save!
    end

    hard_counters.each do |counter|
      puts "Updating HardCounter: #{counter['id']}"
      HardCounter.new(counter).save!
    end

  end

  # TODO
  desc "Update heros & abilites from values in staging tables"
  task :update_from_staging => [:environment] do
    # for every record in staging table, update master table

  end

  # SELECT setval('heros_id_seq', COALESCE((SELECT MAX(id)+1 FROM heros), 1), false);
  # SELECT setval('abilities_id_seq', COALESCE((SELECT MAX(id)+1 FROM abilities), 1), false);

  desc "Re-set staging tables from master values"
  task :reset_staging => [:environment] do
    ActiveRecord::Base.connection.execute("""
      BEGIN;
      DROP TABLE IF EXISTS staging_abilities;
      DROP TABLE IF EXISTS staging_heros;
      CREATE TABLE staging_heros AS
      select *
      from heros;
      CREATE TABLE staging_abilities AS
      select *
      from abilities;
      COMMIT;
    """)
  end


  desc "Update master tables with values from staging tables"
  task :migrate_from_staging => [:environment] do

    # Update Heros
    staging_heros = ActiveRecord::Base.connection.execute(
      "select * from staging_heros;"
    )
    staging_heros.each do |staging_hero|
      master_hero = Hero.find_or_create_by(id: staging_hero['id'])
      puts "Updating #{master_hero.name || "new hero: #{staging_hero['name']}" }"
      puts master_hero.update(staging_hero)
    end

    # Update Abilities
    staging_abilities = ActiveRecord::Base.connection.execute(
      "select * from staging_abilities;"
    )
    staging_abilities.each do |staging_ability|
      master_ability = Ability.find_or_create_by(id: staging_ability['id'])
      puts "Updating #{master_ability.name || "new ability: #{staging_ability['name']}" }"
      puts master_ability.update(staging_ability)
    end

  end

end