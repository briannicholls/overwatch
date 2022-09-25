class Api::V1::HerosController < HerosController
  include ApiKeyAuthenticatable

  prepend_before_action :authenticate_with_api_key!
  
end