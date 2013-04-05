require 'spec_helper'

describe 'v1/requests' do
  let(:user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:another_group) { create(:group) }
  let(:authentication_token) { user.authentication_token }

  before do
    post 'v1/requests', params.merge(authentication_token: authentication_token)
  end

  subject { json_response_body }

  describe 'inviting person' do
    let(:params) do
      {
        group_id: group.id,
        type: 'INVITE',
        email: generate(:email)
      }
    end

    it { should be_an_invite_request_representation(group.invite_requests.first) }

    context 'with invalid params' do
      let(:params) { { group_id: group.id, type: 'INVITE' } }

      it { should have_error("both email and sms can't be blank at the same time").on('receiver') }
    end
  end

  describe 'requesting membership' do
    let(:params) { { group_id: another_group.id, type: 'REQUEST_MEMBERSHIP' } }

    it { should be_an_invite_request_representation(another_group.invite_requests.first) }

    context 'with invalid params' do
      let(:params) { { group_id: group.id, type: 'REQUEST_MEMBERSHIP' } }

      it { should have_error("is already a group member").on('user') }
    end
  end
end
