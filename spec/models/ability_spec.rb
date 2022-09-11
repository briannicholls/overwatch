require 'rails_helper'
require 'pry'
RSpec.describe Ability, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "dps" do
    context "for Abilities that deal damage"
    it "should calculate a valid DPS value" do
      @abilities = Ability.damage_dealing
      @abilities.each do |ability|
        puts "Testing #{ability.hero.name}'s Ability: #{ability.name} (#{ability.keybinding})"
        expect(ability.dps.present?).to be true
      end
    end
  end

end
