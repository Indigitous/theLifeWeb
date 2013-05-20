shared_examples 'a successfull PUT request' do
  let(:action) { :update }
  let(:params) { { format: :json } }

  before { put action, params }

  subject { response }

  it { should be_success }
  its(:code) { should eq('204') }
end
