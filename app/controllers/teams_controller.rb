class TeamsController < ApplicationController
  before_action :set_team

  def create
  end

  def show
  end

  # returns a team
  def get_optimal_counter_composition
    
  end

  private

  def set_team
    @team = Team.first_or_create_by(
      heros_ids: params[:hero_ids],
      role_limit: params[:role_limit]
    )
  end

end
