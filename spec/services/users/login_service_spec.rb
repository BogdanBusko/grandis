require 'rails_helper'

RSpec.describe Users::LoginService do
  describe '.call' do
    subject { described_class.call(user_params) }

    context 'when user present' do
      let!(:user) { create(:user, password: '123456') }

      context 'when email and password combination are correct' do
        let!(:user_params) { { email: user.email, password: '123456' } }

        it 'returns pair of token and user' do
          allow(JsonWebToken).to receive(:encode).with(any_args).and_return('token')

          expect(subject).to eq(['token', user])
        end
      end

      context 'when email and password combination are incorrect' do
        let!(:user_params) { { email: user.email, password: '12356' } }

        it 'returns false for token and user' do
          expect(subject).to eq([false, user])
        end
      end
    end

    context 'when user does not exist' do
      let!(:user) { build(:user, email: 'test@email.com', password: nil) }
      let!(:user_params) { { email: user.email, password: '123456' } }

      it 'returns false for token and initialized user' do
        expect(subject).to eq([false, user])
      end
    end
  end
end
