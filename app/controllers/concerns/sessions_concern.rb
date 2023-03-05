require 'json_web_token'

module SessionsConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :user_signed_in?

    def current_user
      return if cookies['token'].nil?

      user_id = JsonWebToken.decode(cookies['token'])[:id]

      @current_user ||= User.find_by(id: user_id)
    end

    def logout_user!
      @current_user = nil
    end

    def user_signed_in?
      current_user.present?
    end

    private

    def authenticate_user!
      redirect_to root_path unless current_user.present?
    end
  end
end
