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

    it 'responds with an event representation' do
      json_response_body.should be_an_event_representation(current_user.events.first)
    end

    it 'creates an event for the current user' do
      expect(current_user.events.length).to eq 1
    end

    context 'when params are not valid' do
      let(:params) { { friend_id: friend_id } }

      it 'responds with validation error' do
        expect(json_response_body['errors']['activity']).to eq(["can't be blank"])
      end
    end
  end
end
