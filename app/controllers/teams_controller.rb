class TeamsController < ApplicationController
  before_action :set_team, except: [:counter, :index, :new]

  def index
    
  end

  def counter
    @team ||= Team.new
    @heros = Hero.all.sort_by(&:name)
  end

  def calculate_counters
    @team ||= Team.new

    redirect_to team_path(@team)
  end

  def create
    hero_ids = params[:team][:hero_ids].compact_blank
    @team = Team.first_or_create_by_heros(hero_ids)
    # binding.pry
    
    respond_to do |format|
      if @team.persisted?
        format.html { redirect_to @team, notice: "Team counter found." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end

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

  def team_params
    # todo: find out why hero ids are not permitted
    params.require(:team).permit( :hero_ids )
  end

end
