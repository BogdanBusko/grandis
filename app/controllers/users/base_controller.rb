class Users::BaseController < ApplicationController
  before_action :authenticate_user!

  private

  def redirect_when_logged_in!
    redirect_to page_not_found_path if current_user
  end
end
