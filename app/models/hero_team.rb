# Hero in context of a specific team
class HeroTeam < ApplicationRecord
  belongs_to :hero
  belongs_to :team, counter_cache: true, dependent: :destroy

end
