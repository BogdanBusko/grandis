RSpec.shared_context 'redirect_when_user_logged_in' do
  context 'when user logged in' do
    login_user

    it 'redirects to root_path' do
      expect(subject).to redirect_to(root_path)
    end
  end
end
