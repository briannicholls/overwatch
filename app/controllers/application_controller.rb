class ApplicationController < ActionController::Base
  def current_game
    Game.find_by name: 'Overwatch' # 'Overwatch 2'
  end
end
