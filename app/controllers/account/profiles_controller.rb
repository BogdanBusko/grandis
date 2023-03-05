class Account::ProfilesController < Account::AccountController
  def show
    @posts = current_user.posts.ordered.limit(3)
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to account_profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
