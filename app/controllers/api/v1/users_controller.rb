class Api::V1::UsersController < ApplicationController
  # disable CSRF check for API
  protect_from_forgery with: :null_session

  def create
    begin
      @user = User.create({
        email: user_params[:email],
        password: user_params[:password],
        password_confirmation: user_params[:password_confirmation]
      })
    rescue => e
      render json: e, status: :unprocessable_entity
    else
      respond_to do |format|
        if @user.persisted?
          format.json { render :show, status: :created, location: api_v1_users_url(@user) }
        else
          format.json { render json: @user.errors.full_messages.to_sentence, status: :unprocessable_entity }
        end
      end
    end

  end

  private

  def user_params
    params.permit([ :email, :password ])
  end
  
end