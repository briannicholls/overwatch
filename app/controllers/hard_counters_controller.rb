class HardCountersController < ApplicationController

  def index
    @heros = Hero.all
    render json: @heros, include: :disadvantage_heros
  end

  def create
    puts params
  end

end
