class AbilitiesController < ApplicationController
  def index
    if params[:hero_id]
      @abilities = Hero.find(params[:hero_id]).abilities
    else
      @abilities = Ability.all
    end

  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end

  def update
  end
end
