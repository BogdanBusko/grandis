require 'rails_helper'
require 'json_web_token'

RSpec.describe JsonWebToken do
  let!(:user) { create(:user) }

  describe '.encode' do
    subject { described_class.encode({ id: user.id }) }

    it { is_expected.to_not be_nil }
    it { is_expected.to_not eq(user.id) }
  end

  describe '.decode' do
    subject { described_class.decode(token) }

    let!(:token) { described_class.encode({ id: user.id }) }

    it { is_expected.to eq({ id: user.id }) }
  end
end
