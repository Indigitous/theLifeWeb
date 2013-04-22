require 'spec_helper'

describe InviteRequestAcceptor do
  let(:current_user) { create(:user) }
  let(:group) { create(:group, owner: current_user) }
  let(:user) { create(:user) }
  let(:invite_request) { create(:invite_request, user: current_user, group: group, email: user.email) }

  let(:params) { { user: user.id } }

  let(:invite_request_acceptor) { described_class.new(current_user, invite_request, params) }

  describe '#process' do
    subject { invite_request_acceptor.process }

    describe 'when group does not exist' do
      before do
        Group.stub(find_by_id: nil)
      end

      it { should be_persisted }
      its(:errors) { should include(:group) }
    end

    context 'when group members limit is reached' do
      before do
        group.stub(users_count: 9000)
        invite_request_acceptor.stub(group: group)
      end

      it { should be_persisted }
      its(:errors) { should include(:group) }
    end

    describe 'when user does not exit' do
      before do
        User.stub(find_by_id: nil)
      end

      it { should be_persisted }
      its(:errors) { should include(:user) }
    end

    describe 'when user is already a member' do
      before do
        group.users.stub(exists?: true)
        invite_request_acceptor.stub(group: group)
      end

      it { should be_persisted }
      its(:errors) { should include(:user) }
    end

    describe 'when invite request is a membership request and current_user is not an owner' do
      before do
        invite_request.stub(invite?: false)
        group.stub(owner: nil)
        invite_request_acceptor.stub(group: group)
      end

      it { should be_persisted }
      its(:errors) { should include(:user) }
    end

    describe 'when invite request is an invite and user is not an owner of it' do
      before do
        received_invite_requests = double(:invite_request, exists?: false)
        user.stub(received_invite_requests: received_invite_requests)
        invite_request_acceptor.stub(user: user)
      end

      it { should be_persisted }
      its(:errors) { should include(:user) }
    end

    describe 'with valid params' do
      it { should be_a_kind_of GroupUser }
      it { should be_persisted }
    end
  end
end
