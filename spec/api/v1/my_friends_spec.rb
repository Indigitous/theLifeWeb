require 'spec_helper'

describe '/v1/my_friends' do
  let(:current_user) { create :user }
  let(:authentication_token) { current_user.authentication_token }
  let!(:friend) { create :friend, user: current_user }

  describe 'show all friends of this user' do
    before do
      get 'v1/my_friends', authentication_token: authentication_token
    end

    subject { json_response_body }

    it { should be_a_kind_of Array }
    it { should be_a_friend_representation(friend) }
  end
end
