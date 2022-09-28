class Api::V1::UsersController < ApplicationController

  def create
    binding.pry
    
    @user = User.create({
      email:    user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation],
    })

    if @user.persisted?
      render json: @user, status: :created
    else
      render json: @user.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
    
  end

  private

  def user_params
    params[:user].permit([ :email, :password ])
  end
  
end