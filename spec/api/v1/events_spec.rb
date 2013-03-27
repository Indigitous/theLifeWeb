require 'spec_helper'

describe 'v1/events' do
  let(:current_user) { FactoryGirl.create(:user) }
  let(:authentication_token) { current_user.authentication_token }

  describe 'creating an event' do
    let(:activity_id) { FactoryGirl.create(:activity).id }
    let(:friend_id) { FactoryGirl.create(:friend, user: current_user).id }

    let(:params) { { activity_id: activity_id, friend_id: friend_id } }

    before do
      post 'v1/events', params.merge(authentication_token: authentication_token)
    end

    subject { json_response_body }

    it { be_an_event_representation(current_user.events.first) }

    context 'when params are not valid' do
      let(:params) { { friend_id: friend_id } }

      it { should have_error("can't be blank").on('activity') }
    end
  end
end
