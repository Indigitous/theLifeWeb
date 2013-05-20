shared_examples 'a successfull GET request' do
  let(:action) { :index }
  let(:params) { { format: :json } }

  before { get action, params }

  subject { response }

  it { should be_success }
  its(:code) { should eq('200') }
end
