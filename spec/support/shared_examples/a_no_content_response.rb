shared_examples 'a :no_content response' do
  it { should be_success }
  its(:code) { should eq('204') }
end
