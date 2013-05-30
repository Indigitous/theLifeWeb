shared_examples 'a controller that requires an authentication' do
  let(:action) { :index }
  let(:params) { { format: :json } }
  let(:method) { :get }

  before { sign_in nil }

  it 'responds unauthorized with an HTTP 401 status code' do
    send(method, action, params)
    expect(response.code).to eq('401')
  end
end
