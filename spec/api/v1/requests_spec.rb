require 'spec_helper'

describe 'v1/requests' do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:another_group) { create(:group) }
  let!(:invite_request) { create(:invite_request, user: user, group: group, email: another_user.email) }
  let!(:membership_request) { create(:membership_request, user: another_user, group: group) }
  let(:authentication_token) { user.authentication_token }

  describe 'creating invitations' do
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

  describe 'accepting invite requests' do
    let(:group_user) { GroupUser.where(user_id: another_user.id, group_id: group.id).first }

    describe 'when user accepts invitation' do
      let(:params) { { accept: true, user: another_user.id } }

      before do
        post "/v1/requests/#{invite_request.id}/process",
          params.merge(authentication_token: another_user.authentication_token)
      end

      subject { json_response_body }
      it { should be_a_group_user_representation(group_user) }

      context 'with invalid params' do
        let(:params) { { accept: true, user: user.id } }

        it { should have_error('is already a group member').on('user') }
      end
    end

    describe 'when group owner accepts membership request' do
      let(:params) { { accept: true, user: another_user.id } }
      let(:accept_request) do
        post "/v1/requests/#{membership_request.id}/process",
          params.merge(authentication_token: user.authentication_token)
      end

      it 'updates invite request status to accepted' do
        expect { accept_request }
          .to change { membership_request.reload.status }
          .from(InviteRequest::DELIVERED)
          .to(InviteRequest::ACCEPTED)
      end

      describe 'response body' do
        before do
          post "/v1/requests/#{membership_request.id}/process",
            params.merge(authentication_token: user.authentication_token)
        end

        subject { json_response_body }
        it { should be_a_group_user_representation(group_user) }

        context 'with invalid params' do
          let(:params) { { accept: true, user: user.id } }

          it { should have_error('is already a group member').on('user') }
        end
      end
    end
  end

  describe 'rejecting invite requests' do
    describe 'when user rejects invitation' do
      let(:params) { { accept: false, user: another_user.id } }
      let(:reject_request) do
        post "/v1/requests/#{invite_request.id}/process",
          params.merge(authentication_token: another_user.authentication_token)
      end

      it 'updates invite request status to rejected' do
        expect { reject_request }
          .to change { invite_request.reload.status }
          .from(InviteRequest::DELIVERED)
          .to(InviteRequest::REJECTED)
      end

      context 'with invalid params' do
        let(:params) { { accept: false, user: user.id } }

        it 'does not update invite request status' do

          expect { reject_request }.to_not change { invite_request.reload.status }
        end
      end
    end

    describe 'when group owner reject membership request' do
      let(:params) { { accept: false, user: another_user.id } }
      let(:reject_request) do
        post "/v1/requests/#{membership_request.id}/process",
          params.merge(authentication_token: user.authentication_token)
      end

      it 'updates invite request status to rejected' do
        expect { reject_request }
          .to change { membership_request.reload.status }
          .from(InviteRequest::DELIVERED)
          .to(InviteRequest::REJECTED)
      end

      context 'with invalid params' do
        let(:params) { { accept: false, user: -1 } }

        it 'does not update invite request status' do
          expect { reject_request }.to_not change { membership_request.reload.status }
        end
      end
    end
  end
end
