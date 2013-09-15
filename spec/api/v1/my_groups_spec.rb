require 'spec_helper'

describe '/v1/my_groups' do
  let(:current_user) { create :user }
  let(:authentication_token) { current_user.authentication_token }

  describe 'list all groups owned by current user' do
    let!(:group) { create :group, owner: current_user, users: [current_user] }

    before do
      get 'v1/my_groups', authentication_token: authentication_token
    end

    subject { json_response_body }

    it { should be_a_my_group_representation(group) }
  end
end
