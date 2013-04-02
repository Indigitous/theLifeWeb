require 'spec_helper'

describe 'v1/events' do
  let(:current_user) { create(:user) }
  let(:authentication_token) { current_user.authentication_token }

  describe 'creating an event' do
    let(:friend_id) { create(:friend, user: current_user).id }
    let(:params) { { activity_id: activity_id, friend_id: friend_id } }
    let(:activity_id) { create(:activity).id }

    before do
      post 'v1/events', params.merge(authentication_token: authentication_token)
    end

    subject { json_response_body }

    it { should be_an_event_representation(current_user.events.first) }

    context 'when params are not valid' do
      let(:params) { { friend_id: friend_id } }

      it { should have_error("can't be blank").on('activity') }
    end
  end

  describe 'show events for user' do
    before do
      create(:event, user: current_user)
      get 'v1/events', authentication_token: authentication_token
    end

    subject { json_response_body }

    it { should be_an_event_representation(current_user.events.first) }
  end
end
