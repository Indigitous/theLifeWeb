require 'spec_helper'

describe InviteRequester do
  let(:another_user) { create(:user) }
  let(:user) { create(:user) }
  let(:group) { create(:group, owner: another_user) }
  let(:params) { { group_id: group.id } }

  let(:invite_requester) { described_class.new(user, params) }

  describe '#create' do
    subject { invite_requester.create }

    its(:email) { should == another_user.email }
    its(:sms) { should == another_user.mobile }

    context 'when group does not exist' do
      before do
        invite_requester.stub(group: nil)
      end

      it { should_not be_persisted }
      its(:errors) { should include(:group) }
    end

    context 'when group members limit is reached' do
      before do
        Group.any_instance.stub(users_count: 9000)
      end

      it { should_not be_persisted }
      its(:errors) { should include(:group) }
    end

    context 'when user is already a member' do
      before do
        group.users.stub(exists?: true)
        invite_requester.stub(group: group)
      end

      it { should_not be_persisted }
      its(:errors) { should include(:user) }
    end

    context 'when user is a group owner' do
      before do
        group.stub(owner: user)
        invite_requester.stub(group: group)
      end

      it { should_not be_persisted }
      its(:errors) { should include(:user) }
    end

    context 'with valid params' do
      it { should be_persisted }
    end
  end
end
