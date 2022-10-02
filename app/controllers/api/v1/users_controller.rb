class Api::V1::UsersController < ApplicationController

  def create
    @user = User.create({
      email:    user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation],
    })

    respond_to do |format|
      if @user.persisted?
        
        format.json { render :show, status: :created, location: @user }
      else
        # format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors.full_messages.to_sentence, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.permit([ :email, :password ])
  end
  
end