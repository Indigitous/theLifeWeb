require 'spec_helper'

describe 'v1/my_requests' do
  let(:user) { create(:user) }
  let(:invited_user) { create(:user) }
  let(:authentication_token) { invited_user.authentication_token }
  let(:group) { create(:group, owner: user) }

  let!(:invite_request) do
    create(:invite_request, user: user, group: group, email: invited_user.email)
  end

  subject { json_response_body }

  describe 'get requests sent to me' do
    before do
      get '/v1/my_requests', authentication_token: authentication_token
    end

    it { should be_a_kind_of Array }
    its(:first) { should be_an_invite_request_representation(invite_request) }
  end
end
