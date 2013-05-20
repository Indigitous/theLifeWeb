require 'spec_helper'

describe '/v1/my_friends' do
  let(:current_user) { create :user }
  let(:authentication_token) { current_user.authentication_token }

  describe 'show all friends of this user' do
    let!(:friend) { create :friend, user: current_user }

    before do
      get 'v1/my_friends', authentication_token: authentication_token
    end

    subject { json_response_body }

    it { should be_a_kind_of Array }
    it { should be_a_friend_representation(friend) }
  end

  it_behaves_like('an api with timestamps') do
    let!(:resources) { create_list :friend, 2, user: current_user }
    let(:resources_url) { polymorphic_path([:v1, :my_friends]) }
  end
end
