class LoginUserService < ApplicationService
  def initialize(email, password)
    @email = email
    @password = password
  end

  def valid_password?
    user.password == @password
  end

  def new_user?
    !user.present?
  end

  private

  def user
    User.find_by(email: @email)
  end
end
