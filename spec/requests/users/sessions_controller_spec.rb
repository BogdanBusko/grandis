require 'rails_helper'

RSpec.describe Users::SessionsController, type: :request do
  describe 'GET #index' do
    it 'is successful' do
      get users_sessions_path

      expect(response).to be_successful
    end

    include_context 'redirect_when_user_logged_in'
  end

  describe 'POST #create' do
    subject { post users_sessions_path, params: }

    let!(:user) { create(:user, password: '123456') }
    let!(:params) do
      {
        user: {
          email: user.email,
          password: '123456'
        }
      }
    end

    context 'with valid email and password combination' do
      it 'adds token to cookies' do
        subject

        expect(cookies[:token]).to_not be_nil
      end

      it { is_expected.to redirect_to(root_path) }
    end

    context 'with invalid email and password combination' do
      let!(:params) do
        {
          user: {
            email: user.email,
            password: '12345'
          }
        }
      end

      it 'is successful' do
        subject

        expect(response).to be_successful
      end

      it 'adds token to cookies' do
        subject

        expect(cookies[:token]).to be_nil
      end
    end

    include_context 'redirect_when_user_logged_in'
  end

  describe 'DELETE #destroy' do
    subject { delete users_sessions_path }

    context 'when user logged in' do
      login_user

      it 'removes user token from cookies' do
        expect(cookies[:token]).to be_present

        subject

        expect(cookies[:token]).to be_empty
      end

      it 'redirects to root_path after successful log out' do
        subject

        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user logged out' do
      it 'redirects user to 404' do
        subject

        expect(response).to redirect_to(page_not_found_path)
      end
    end
  end
end
