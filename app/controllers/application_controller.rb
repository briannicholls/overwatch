class ApplicationController < ActionController::Base
  # disable CSRF check for API
  protect_from_forgery with: :null_session

  def current_game
    Game.find_by name: 'Overwatch' # 'Overwatch 2'
  end
end
