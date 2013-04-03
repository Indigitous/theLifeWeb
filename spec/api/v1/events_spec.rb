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
    before { create :event, user: current_user }

    subject { json_response_body }

    context 'user must see his events' do
      before do
        get 'v1/events', authentication_token: authentication_token
      end

      it { should be_an_event_representation(current_user.events.first) }
      its(:size) { should eq(1) }
    end

    context "user must not see not group comembers's events" do
      let(:other_user) { create :user }

      before do
        create :event, user: other_user
        get 'v1/events', authentication_token: authentication_token
      end

      its(:size) { should eq(1) }
    end

    context "user must see his comembers' events" do
      let(:group_comember) { create :user }

      before do
        create(:group,
          owner: current_user,
          users: [current_user, group_comember]
        )
        create :event, user: group_comember
        get 'v1/events', authentication_token: authentication_token
      end

      its(:size) { should eq(2) }
    end
  end
end
