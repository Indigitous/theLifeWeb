require 'spec_helper'

describe 'v1/events/:event_id/pledge' do
  let(:current_user) { create(:user) }
  let(:authentication_token) { current_user.authentication_token }

  describe 'Pledge to pray for an event' do
    let(:event) do
      create(:group_event, group_users: [current_user], prayer_requested: true)
    end

    before do
      post "v1/events/#{event.id}/pledge",
        authentication_token: authentication_token
    end

    subject { json_response_body }

    it { should be_a_pledge_representation(current_user.pledges.first) }


    describe 'creates an event duplicate' do
      subject { Event.find_by_target_event_id(event.id) }

      it { should be }
      its(:pledges_count) { should eq event.reload.pledges_count }
    end

    context 'for the second time' do
      before do
        post "v1/events/#{event.id}/pledge",
        authentication_token: authentication_token
      end

      it { should have_error("you can't pray for an event twice").on('event_id') }
    end

    context 'when current_user is creator' do
      let(:event) do
        create(:event, user: current_user, prayer_requested: true)
      end

      it { should have_error("you can't pray for self event").on('event_id') }
    end

    context 'when prayer is not requested' do
      let(:event) { create(:group_event, group_users: [current_user]) }
      it { should have_error("you can't pray for an event where prayer is not requested").on('event_id') }
    end
  end
end
