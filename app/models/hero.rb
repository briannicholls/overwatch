class Hero < ApplicationRecord
  belongs_to :role
  
  has_many :hard_counters
end
