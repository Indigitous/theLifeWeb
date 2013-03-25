# Shared example to ensure that a controller requires
# authentication.
#
# Example:
#   describe V1::FriendsController do
#     it_behaves_like "a controller that requires an authentication" do
#       let(:action) { :create }
#       let(:params) { { first_name: 'Homer' } }
#     end
#   end
#
shared_examples 'a controller that requires an authentication' do
  let(:action) { :index }
  let(:params) { {} }

  before { sign_out(:user) }

  it 'responds unauthorized with an HTTP 401 status code' do
    get action, params
    expect(response.code).to eq('401')
  end
end
