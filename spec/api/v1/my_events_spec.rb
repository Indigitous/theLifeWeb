require 'spec_helper'

describe '/v1/my_events' do
  let(:current_user) { create :user }
  let(:authentication_token) { current_user.authentication_token }

  describe 'show events for user' do
    let(:params) { { authentication_token: authentication_token } }
    let!(:events) { create_list(:event, 2, user: current_user) }

    before { get('v1/my_events', params) }

    subject { json_response_body }

    it { should be_a_my_event_representation(events.first) }

    context 'after the specified' do
      let(:params) do
        { after: events.first.id, authentication_token: authentication_token }
      end

      its(:length) { should eq(1) }
      it { should be_a_my_event_representation(events.last) }
    end
  end
end
