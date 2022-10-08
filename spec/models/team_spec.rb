require 'rails_helper'
require 'pry'

RSpec.describe Team, type: :model do

  context "All Teams" do
    
    it "should be valid" do
      Team.all.all?(&:valid?)
    end

    # can remove below - this is added to AR validation
    it "should have 5 heros" do
      all_teams_have_5_heroes = Team.all.all?{|team| team.heros.length == 5 }
      expect(all_teams_have_5_heroes).to be true
    end

  end

end
