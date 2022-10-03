class Api::V1::UsersController < ApplicationController
  # disable CSRF check for API
  protect_from_forgery with: :null_session

  def create
    @user = User.find_or_create_by({
      email:    user_params[:email]
    })

    if @user.persisted?
      unless @user.authenticate password: user_params[:password]
        render json: "Incorrect password", status: :unauthorized
        return
      end
    else
      @user.update({
        password: user_params[:password],
        password_confirmation: user_params[:password_confirmation]
      })
    end

    # render json: @user

    respond_to do |format|
      format.json { render :show, status: :created, location: api_v1_users_url(@user) }
    end
  end

  private

  def user_params
    params.permit([ :email, :password ])
  end
  
end