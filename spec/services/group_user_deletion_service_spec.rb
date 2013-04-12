require 'spec_helper'

describe GroupUserDeletionService do
  let(:group_owner) { create :user }
  let(:group_user) { create :user }
  let(:other_user) { create :user }
  let(:group) do
    create :group, owner: group_owner, users: [group_owner, group_user]
  end

  let(:service) { described_class.new(group_owner, params) }

  describe "#exclude" do
    subject { service.exclude }

    describe 'owner can delete member of the group' do
      let(:params) { { group_id: group.id, id: group_user.id } }

      it { should be_true}
    end

    describe 'owner cannot delete himself' do
      let(:params) { { group_id: group.id, id: group_owner.id } }

      it { should be_false }
    end

    describe 'owner cannot delete non-member user from a group' do
      let(:params) { { group_id: group.id, id: other_user.id } }

      it { should be_false }
    end

    describe 'non-owner cannot delete anyone from a group' do
      let!(:group) { create :group, users: [group_owner, group_user] }
      let(:params) { { group_id: group.id, id: other_user.id } }

      it { should be_false }
    end
  end
end
