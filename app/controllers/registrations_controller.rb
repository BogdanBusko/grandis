require 'json_web_token'

class RegistrationsController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      cookies[:token] = JsonWebToken.encode({ id: @user.id, email: @user.email })

      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
