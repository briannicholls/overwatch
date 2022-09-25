require 'rails_helper'
require 'pry'

RSpec.describe Ability, type: :model do
  context "for Abilities that deal damage"
    @abilities = Ability.non_ultimates.damage_dealing
    @abilities.each do |ability|
      describe "#{ability.name}#dps" do
        it "should calculate a valid DPS value" do
          puts "Testing #{ability.hero.name}'s Ability: #{ability.name} (#{ability.keybinding})"
          expect(ability.dps.present?).to be true
        end
    end
  end
end
