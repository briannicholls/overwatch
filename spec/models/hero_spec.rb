require 'rails_helper'

RSpec.describe Hero, type: :model do
  describe "#all" do
    it "should return valid heroes" do
      Hero.all.all?(&:valid?)
    end
  end
end
