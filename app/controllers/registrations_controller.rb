class Session::RegistrationsController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new

    if @user.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
