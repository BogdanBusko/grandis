require 'rails_helper'

RSpec.describe RegistrationsController do
  describe 'GET #index' do
    it 'is successful' do
      get registrations_path

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject { post registrations_path, params: }

    context 'with valid params' do
      let!(:params) do
        {
          user: {
            email: 'example@email.com',
            password: '123456',
            password_confirmation: '123456'
          }
        }
      end

      it 'adds token to cookies' do
        subject

        expect(cookies[:token]).to_not be_nil
      end

      it { expect { subject }.to change(User, :count).by(1) }
      it { is_expected.to redirect_to(root_path) }
    end

    context 'with invalid params' do
      let!(:params) do
        {
          user: {
            email: 'exampleemail.com',
            password: '',
            password_confirmation: '1234'
          }
        }
      end

      it 'is successful' do
        subject

        expect(response).to be_successful
      end

      it { expect { subject }.to_not change(User, :count) }
    end
  end
end
