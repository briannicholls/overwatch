class HeroTeam < ApplicationRecord
  # A.K.A. "Team Composition"
  belongs_to :hero
  belongs_to :team
end
