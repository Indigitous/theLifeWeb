require 'spec_helper'

describe '/v1/my_events' do
  let(:current_user) { create :user }
  let(:authentication_token) { current_user.authentication_token }

  describe 'show events for user' do
    before do
      create(:event, user: current_user)
      get 'v1/my_events', authentication_token: authentication_token
    end

    subject { json_response_body }

    it { should be_an_event_representation(current_user.events.first) }
  end
end
