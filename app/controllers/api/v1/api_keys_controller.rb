class Api::V1::ApiKeysController < ApplicationController
  include ApiKeyAuthenticatable 
  
  # disable CSRF check for API
  # protect_from_forgery with: :null_session

  # Require token authentication for index                             
  prepend_before_action :authenticate_with_api_key!, only: [:index, :destroy]
 
  def index
    render json: current_bearer.api_keys
  end

  def create
    # use basic auth for creating key
    authenticate_with_http_basic do |email, password| 
      user = User.find_by email: email 
      if user&.authenticate(password) 
        api_key = user.api_keys.create! token: SecureRandom.hex
        render json: api_key.token, status: :created and return 
      end 
    end
 
    render json: '', status: :unauthorized
  end

  def destroy
    api_key = current_bearer.api_keys.find(params[:id])
    api_key.destroy
  end
  
end