shared_examples 'a successfull DELETE request' do
  let(:action) { :destroy }
  let(:params) { { format: :json} }

  before { delete action, params }

  subject { response }

  it { should be_success }
  its(:code) { should eq('204') }
end
