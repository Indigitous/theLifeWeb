require 'spec_helper'

describe InviteRequester do
  let(:user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:params) do
    { receiver: generate(:email) }
  end

  let(:invite_requester) { described_class.new(user, group, params) }

  describe '#create' do
    subject { invite_requester.invite_request }

    context 'when user is not an owner of the group' do
      let(:another_user) { build(:user) }

      before do
        group.stub(owner: another_user)
        invite_requester.create
      end

      it { should_not be_persisted }
      its(:errors) { should include(:user) }
    end

    context 'when user is already a member' do
      before do
        group.users.stub(exists?: true)
        invite_requester.create
      end

      it { should_not be_persisted }
      its(:errors) { should include(:receiver) }
    end

    context 'with invalid invite request instance' do
      before do
        InviteRequest.any_instance.stub(save: false)
        InviteRequest.any_instance.stub(errors: double('errors'))
        invite_requester.create
      end

      it { should_not be_persisted }
    end
  end
end
