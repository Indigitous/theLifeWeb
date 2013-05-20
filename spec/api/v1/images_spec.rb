require 'spec_helper'

describe '/v1/images' do
  let(:current_user) { create :user, :with_image }
  let(:authentication_token) { current_user.authentication_token }

  describe 'show image' do
    let(:params) { { authentication_token: authentication_token } }

    subject { response.body }

    context 'for a user' do
      before { get("v1/image/users/#{current_user.id}", params) }

      it { should be_a_file_representation(current_user.image) }
    end

    context 'for a friend' do
      let(:friend) { create :friend, :with_image, user: current_user }
      before { get("v1/image/friends/#{friend.id}", params) }

      it { should be_a_file_representation(friend.image) }
    end

    context 'for an activity' do
      let(:activity) { create :activity, :with_image }
      before { get("v1/image/activities/#{activity.id}", params) }

      it { should be_a_file_representation(activity.image) }
    end
  end
end
