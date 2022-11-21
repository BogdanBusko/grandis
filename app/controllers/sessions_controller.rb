require 'json_web_token'

class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user&.authenticate(params[:user][:password])
      cookies[:token] = JsonWebToken.encode({ id: @user.id, email: @user.email })

      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
