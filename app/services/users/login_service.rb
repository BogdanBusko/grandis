require 'json_web_token'

module Users
  class LoginService < ApplicationService
    def initialize(params)
      @email = params[:email]
      @password = params[:password]
    end

    def call
      user_token = user&.authenticate(@password) ? token : false

      [user_token, user]
    end

    private

    attr_reader :email

    def user
      @user ||= User.find_or_initialize_by(email:)
    end

    def token
      JsonWebToken.encode({ id: user.id })
    end
  end
end
