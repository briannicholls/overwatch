namespace :db do
  desc "Destroy test DB and replace with values from development DB"
  task :copy_db => [:environment] do
    return if Rails.env != 'development'

    # ActiveRecord::Base.establish_connection :development
    game_attributes    = Game.all.map(&:attributes)
    role_attributes    = Role.all.map(&:attributes)
    hero_attributes    = Hero.all.map(&:attributes)
    ability_attributes = Ability.all.map(&:attributes)
    
    ActiveRecord::Base.establish_connection :test

    # Remove existing data before inserting new data
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

  end
end