shared_examples 'an api with timestamps' do
  let!(:resources) { create_list(:activity, 2) }
  let(:resources_url) { polymorphic_path([:v1, resources.first.class]) }
  let(:auth_token) { nil }

  before do
    get(resources_url, authentication_token: auth_token)
  end

  subject { json_response_body }

  its(:size)  { should eq(resources.count) }

  context 'when timestamp param is given' do
    before do
      resources.last.update_attributes(updated_at: 10.minutes.from_now)

      get resources_url,
        authentication_token: auth_token,
        timestamp: 1.minute.from_now.to_i
    end

    its(:size)  { should eq(1) }
    its(:first) { should be_a_representation_of(resources.last) }
  end
end
