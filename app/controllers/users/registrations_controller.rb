class Users::RegistrationsController < Users::BaseController
  skip_before_action :authenticate_user!

  before_action :redirect_when_logged_in!

  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      cookies[:token] = Users::LoginService.call(user_params)

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
