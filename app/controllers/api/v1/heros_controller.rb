class Api::V1::HerosController < HerosController
  include ApiKeyAuthenticatable
  
  prepend_before_action :authenticate_with_api_key!

  before_action :add_monetization_header

  private

  def add_monetization_header
    response.headers['X-API-Weight'] = 1
  end
  
end