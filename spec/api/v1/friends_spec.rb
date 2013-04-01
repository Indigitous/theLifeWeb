require 'spec_helper'

describe 'v1/friends' do
  let(:current_user) { create(:user) }
  let(:authentication_token) { current_user.authentication_token }

  describe 'creating a friend' do
    let(:threshold_id) { create(:threshold).id }

    let(:params) do
      attributes_for(:friend, threshold_id: threshold_id)
    end

    before do
      post 'v1/friends', params.merge(authentication_token: authentication_token)
    end

    subject { json_response_body }

    it { should be_a_friend_representation(current_user.friends.first) }

    context 'when params are not valid' do
      let(:params) { { first_name: 'Homer' } }

      it { should have_error("can't be blank").on('last_name') }
    end
  end
end
