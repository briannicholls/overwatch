class HardCountersController < ApplicationController
  def index
    @heros = Heros.all
    
  end
end
