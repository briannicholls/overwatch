require 'rails_helper'
require 'pry'
RSpec.describe Ability, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "dps" do
    before do
      @abilities = Ability.damage_dealing
    end
    context "if this ability does damage"
    it "should return a valid dps" do
      # binding.pry
      expect(@abilities.map(&:dps).all?(&:present?)).to be true
    end
  end

end
