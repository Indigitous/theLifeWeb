require 'spec_helper'

describe V1::InviteRequestsController do
  let(:user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:another_user) { create(:user) }
  let(:another_group) { create(:group) }

  before do
    sign_in(user)
  end

  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:method) { :post }
  end

  subject { response }

  describe '#create' do
    context 'inviting person' do
      let(:params) do
        {
          group_id: group.id,
          email: generate(:email),
          type: 'INVITE',
          format: :json
        }
      end

      context 'with valid params' do
        before do
          post :create, params
        end

        it_behaves_like 'a :created response'
      end

      context 'with invalid params' do
        let(:params) do
          {
            group_id: group.id,
            format: :json
          }
        end

        before do
          post :create, params
        end

        it_behaves_like 'an :unprocessable_entity response'
      end
    end

    context 'requesting membership' do
      let(:params) do
        {
          group_id: another_group.id,
          type: 'REQUEST_MEMBERSHIP',
          format: :json
        }
      end

      context 'with valid params' do
        before do
          post :create, params
        end

        it_behaves_like 'a :created response'
      end

      context 'with invalid params' do
        let(:params) do
          {
            group_id: group.id,
            format: :json
          }
        end

        before do
          post :create, params
        end

        it_behaves_like 'an :unprocessable_entity response'
      end
    end
  end

  describe '#handle' do
    let(:invite_request) { create(:invite_request, user: user, group: group, email: another_user.email) }
    let(:membership_request) { create(:membership_request, user: another_user, group: group) }
    let(:invite_request_params) do
      {
        id: invite_request.id,
        accept: true,
        user: another_user.id,
        format: :json
      }
    end

    let(:membership_request_params) do
      {
        id: membership_request.id,
        accept: true,
        user: another_user.id,
        format: :json
      }
    end

    context 'when user accepts invite' do
      before { sign_in(another_user) }

      context 'with valid params' do
        before do
          post :handle, invite_request_params
        end

        it_behaves_like 'a :created response'
      end

      context 'with invalid params' do
        before do
          post :handle, invite_request_params.merge(user: user.id)
        end

        it_behaves_like 'an :unprocessable_entity response'
      end
    end

    context 'when group owner accepts membership request' do
      before { sign_in(user) }

      context 'with valid params' do
        before do
          post :handle, membership_request_params
        end

        it_behaves_like 'a :created response'
      end

      context 'with invalid params' do
        before do
          post :handle, membership_request_params.merge(user: user.id)
        end

        it_behaves_like 'an :unprocessable_entity response'
      end
    end

    context 'when user rejects invite' do
      before { sign_in(another_user) }

      context 'with valid params' do
        before do
          post :handle, invite_request_params.merge(accept: false)
        end

        it_behaves_like 'a :no_content response'
      end

      context 'with invalid params' do
        before do
          post :handle, invite_request_params.merge(accept: false, user: user.id)
        end

        it_behaves_like 'an :unprocessable_entity response'
      end
    end

    context 'when group owner rejects membership request' do
      before { sign_in(user) }

      context 'with valid params' do
        before do
          post :handle, membership_request_params.merge(accept: false)
        end

        it_behaves_like 'a :no_content response'
      end

      context 'with invalid params' do
        before do
          post :handle, membership_request_params.merge(accept: false, user: -1)
        end

        it_behaves_like 'an :unprocessable_entity response'
      end
    end
  end
end
