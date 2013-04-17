require 'spec_helper'

describe 'v1/events' do
  let(:current_user) { create(:user) }
  let(:authentication_token) { current_user.authentication_token }

  describe 'creating an event' do
    let(:friend) { create(:friend, user: current_user) }
    let(:params) { { activity_id: activity_id, friend_id: friend.id } }
    let(:activity_id) { create(:activity).id }

    before do
      post 'v1/events', params.merge(authentication_token: authentication_token)
    end

    subject { json_response_body }

    it { should be_an_event_representation(current_user.events.first) }

    context 'when params are not valid' do
      let(:params) { { friend_id: friend.id } }

      it { should have_error("can't be blank").on('activity') }
    end

    context 'when threshold is changed' do
      let(:new_contact) { create(:threshold, title: 'New contact')  }
      let!(:trusting) { create(:threshold, title: 'Trusting')  }
      let(:friend) { create(:friend, threshold: new_contact, user: current_user) }

      let(:params) do
        { activity_id: activity_id, friend_id: friend.id, threshold_id: trusting.id }
      end

      it "updates a friend's threshold" do
        friend.reload.threshold.should eq(trusting)
      end
    end
  end
end
