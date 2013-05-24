shared_examples 'an api with timestamps' do
  let!(:resources) { create_list(:activity, 2) }
  let(:resources_url) { polymorphic_path([:v1, resources.first.class]) }

  before do
    get(resources_url, authentication_token: authentication_token)
  end

  subject { json_response_body['data'] }

  its(:size)  { should eq(resources.count) }

  context 'when timestamp param is given' do
    before do
      resources.last.update_attributes(updated_at: 10.minutes.from_now)

      get resources_url,
        authentication_token: authentication_token,
        timestamp: 1.minute.from_now.to_i
    end

    its(:size)  { should eq(1) }
    its(:first) { should be_a_representation_of(resources.last) }
  end

  context 'when no results to return' do
    let(:time_now) { DateTime.now }

    before do
      Time.stub(:now).and_return(time_now)

      get resources_url,
        authentication_token: authentication_token,
        timestamp: 1.minute.from_now.to_i
    end

    subject { json_response_body }

    it { should include('data' => []) }
    it { should include('meta' => { 'server_timestamp' => time_now.to_i }) }
  end
end
