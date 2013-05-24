require 'spec_helper'

describe 'v1/groups' do
  let(:current_user) { create :user }
  let(:authentication_token) { current_user.authentication_token }

  subject { json_response_body }

  describe 'creating a group' do
    let(:params) { attributes_for(:group) }

    before do
      post 'v1/groups', params.merge(authentication_token: authentication_token)
    end

    it { should be_a_group_representation(current_user.owned_groups.first) }

    describe 'group owner should become a member of his group' do
      let(:group) { Group.find(json_response_body['id']) }
      subject { group }

      its(:users) { should include(group.owner) }
    end

    context 'when params are not valid' do
      let(:params) { { name: 'The best group ever!' } }

      it { should have_error("can't be blank").on('description') }
    end
  end

  describe 'list groups' do
    let!(:group) { FactoryGirl.create(:group) }

    before do
      get 'v1/groups', params.merge(authentication_token: authentication_token)
    end

    context 'all groups(no query given)' do
      let(:params) { {} }

      it { should be_a_kind_of Array }
      its(:first) { should be_a_group_representation(group) }
    end

    context 'searching groups(some query given)' do
      let(:params) { { query: group.name.split.first } }

      it { should be_a_kind_of Array }
      its(:first) { should be_a_group_representation(group) }
    end
  end

  describe 'delete a group' do
    let!(:group) { create(:group, owner: current_user) }
    let(:invite_request) { create :invite_request, group: group, sender: current_user }

    let(:delete_request) do
      delete "/v1/groups/#{group.id}",
        authentication_token: authentication_token
    end

    subject { -> { delete_request } }

    it { should destroy_from_db(group) }
    it { should destroy_from_db(invite_request) }

    describe 'with invalid params' do
      let!(:group) { create(:group) }

      it { should_not destroy_from_db(group) }
      it { should_not destroy_from_db(invite_request) }
    end
  end

  describe 'remove user from a group' do
    let(:group_member) { create :user }

    describe 'when all params are valid' do
      let!(:group) do
        create :group, owner: current_user, users: [current_user, group_member]
      end

      it 'successfully removes user from a group' do
        expect do
          delete "/v1/groups/#{group.id}/users/#{group_member.id}",
            authentication_token: current_user.authentication_token
        end.to change { group.reload.users.count }
      end
    end

    describe 'when params are invalid' do
      describe 'when current user is not a group owner' do
        let!(:group) { create :group, users:[current_user, group_member] }

        it 'does not remove user from a group' do
          expect do
            delete "v1/groups/#{group.id}/users/#{group_member.id}",
              authentication_token: current_user.authentication_token
          end.not_to change { group.reload.users.count }
        end
      end

      describe 'when user is not a group member' do
        let!(:group) do
          create :group, users:[current_user], owner: current_user
        end

        it 'does not remove user from a group' do
          expect do
            delete "v1/groups/#{group.id}/users/#{group_member.id}",
              authentication_token: current_user.authentication_token
          end.not_to change { group.reload.users.count }
        end
      end
    end
  end
end
