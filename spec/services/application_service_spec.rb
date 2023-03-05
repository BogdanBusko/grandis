require 'rails_helper'

RSpec.describe ApplicationService do
  describe '#call' do
    it 'raises an error when method is not implemented' do
      expect(ApplicationService.new.call).to raise_error(::ImplementMe)
    end
  end
end
