require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  describe 'GET #index' do
    it 'is successful' do
      get sessions_path

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject { post sessions_path, params: }

    let!(:user) { create(:user, password: '123456') }

    context 'with valid email and password combination' do
      let!(:params) do
        {
          user: {
            email: user.email,
            password: '123456'
          }
        }
      end

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
  end
end
