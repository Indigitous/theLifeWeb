require 'spec_helper'

describe FriendDeletionService do
  let(:current_user) { create(:user) }
  let(:friend) { create :friend, user: current_user }
  let(:params) { { id: friend.id } }

  let(:service) { described_class.new(current_user, params) }

  describe '#delete' do
    subject { service.delete }

    context 'when there is no such friend' do
      before do
        current_user.friends.stub(find_by_id: nil)
      end

      it { should be_false }
    end

    context 'with valid params' do
      it { should be_true }
    end
  end
end
