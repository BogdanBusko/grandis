class Users::SessionsController < Users::BaseController
  skip_before_action :authenticate_user!, only: [:index, :create]

  before_action :redirect_when_logged_in!, only: [:index, :create]

  def index
    @user = User.new
  end

  def create
    token, @user = Users::LoginService.call(params[:user])

    if token.present?
      cookies[:token] = token

      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
    cookies.delete(:token)

    redirect_to root_path
  end
end
