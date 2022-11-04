class ApplicationController < ActionController::Base
  # disable CSRF check for API
  protect_from_forgery with: :null_session
end
