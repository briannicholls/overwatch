class TeamsController < ApplicationController
  before_action :set_team

  def index
    
  end

  def create
  end

  def show
  end

  # returns a team
  def get_optimal_counter_composition
    
  end

  private

  def set_team
    # binding.pry
    if !params[:hero_ids]
      # render json: status: 404
      return
    else
      heros = Hero.where(id: params[:hero_ids])
      @team = Team.find_or_create_by(
        heros: heros,
        role_limit: params[:role_limit]
      )
    end
  end

end
