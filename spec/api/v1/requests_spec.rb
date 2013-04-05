require 'spec_helper'

describe 'v1/requests' do
  let(:user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:authentication_token) { user.authentication_token }
  let(:params) do
    {
      group_id: group.id,
      email: generate(:email)
    }
  end

  describe 'creating a request' do
    before do
      post 'v1/requests', params.merge(authentication_token: authentication_token)
    end

    subject { json_response_body }

    it { should be_an_invite_request_representation(user.invite_requests.first) }

    context 'with invalid params' do
      let(:params) { { group_id: group.id } }

      it { should have_error("both email and sms can't be blank at the same time").on('receiver') }
    end
  end
end
