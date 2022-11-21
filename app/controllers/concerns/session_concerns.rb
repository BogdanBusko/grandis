module SessionConcerns
  extend ActiveSupport::Concern

  class_methods do
    def current_user
      user_id = JWT.decode(cookies_token)[:id ]

      User.find(user_id)
    end

    def user_logged_in?
      current_user.present?
    end
  end
end
