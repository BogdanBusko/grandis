module LoginHelper
  include Rails.application.routes.url_helpers

  def login_user
    before do
      user = FactoryBot.create(:user, password: '123456')

      post users_sessions_path, params: {
        user: {
          email: user.email,
          password: '123456'
        }
      }
    end
  end
end
