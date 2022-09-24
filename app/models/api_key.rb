class ApiKey < ApplicationRecord
  belongs_to :bearer, polymorphic: true
  before_create :one_key_per_user
  
  def one_key_per_user
    user.api_keys.destroy_all if user&.api_keys.present?
  end
end