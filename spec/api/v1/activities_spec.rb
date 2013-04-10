require 'spec_helper'

describe '/v1/activities' do
  let(:current_user) { create :user }
  let(:authentication_token) { current_user.authentication_token }

  describe 'show activities apllicable for friend' do
    let(:threshold) { create :threshold, title: Threshold::TITLES[0] }
    let(:another_threshold) { create :threshold, title: Threshold::TITLES[1] }
    let!(:activity) { create :activity, thresholds: [threshold] }

    before do
      create(:activity, thresholds: [another_threshold])

      get 'v1/activities',
        authentication_token: authentication_token,
        threshold_id: threshold.id
    end

    subject { json_response_body }

    it { should be_an_activity_representation(activity) }
    its(:size) { should eq(1) }
  end
end
