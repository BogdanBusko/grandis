class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:email])

    redirect_to registrations_path unless @user.present?

    if @user.password == params[:user][:password]
      render text: 'You are logged in!'
    else
      render turbo_stream: [
        turbo_stream.update('login_error', text: 'Wrong password or email')
      ]
    end
  end
end
