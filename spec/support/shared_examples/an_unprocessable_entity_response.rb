shared_examples 'an :unprocessable_entity response' do
  it { should_not be_success }
  its(:code) { should eq('422') }
end
