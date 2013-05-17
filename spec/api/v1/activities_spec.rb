require 'spec_helper'

describe '/v1/activities' do
  let(:current_user) { create :user }
  let(:authentication_token) { current_user.authentication_token }

  let(:threshold) { create :threshold, title: Threshold::TITLES[0] }
  let(:another_threshold) { create :threshold, title: Threshold::TITLES[1] }
  let!(:activity) { create :activity, thresholds: [threshold] }

  subject { json_response_body }

  describe 'show activities apllicable for friend' do
    before do
      create(:activity, thresholds: [another_threshold])

      get 'v1/activities',
        authentication_token: authentication_token,
        threshold_id: threshold.id
    end

    its(:first) { should be_an_activity_representation(activity) }
    its(:size) { should eq(1) }
  end

  describe 'show activities modified since given timestamp' do
    let!(:another_activity) { create :activity,
      thresholds: [another_threshold],
      updated_at: 1.hour.from_now
    }

    before do
      create(:activity, thresholds: [another_threshold])

      get 'v1/activities',
        authentication_token: authentication_token,
        timestamp: 1.minute.from_now.to_i
    end

    its(:first) { should be_an_activity_representation(another_activity) }
    its(:size)  { should eq(1) }
  end
end
