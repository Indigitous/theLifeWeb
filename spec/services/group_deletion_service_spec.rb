require 'spec_helper'

describe GroupDeletionService do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:group) { create(:group, owner: user, users: [another_user]) }
  let(:params) { { id: group.id } }

  let(:group_deletion_service) { described_class.new(user, params) }

  describe '#destroy' do
    subject { group_deletion_service.destroy }

    context 'when group does not exist or user is not a group owner' do
      before do
        user.owned_groups.stub(find_by_id: nil)
      end

      it { should be_false }
    end

    context 'with valid params' do
      it { should be_true }
    end
  end
end
