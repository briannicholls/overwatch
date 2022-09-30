class User < ApplicationRecord
  has_many :api_keys, as: :bearer
  has_secure_password

  after_create :send_confirmation_token

  # todo
  def send_confirmation_token
    
  end
  
end