require 'rails_helper'

RSpec.describe Hero, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe ".all" do
    it "should return all valid heroes" do
      Hero.all.all?(&:valid?)
    end
  end
end
