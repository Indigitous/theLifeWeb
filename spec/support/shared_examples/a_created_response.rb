shared_examples 'a :created response' do
  it { should be_success }
  its(:code) { should eq('201') }
end
