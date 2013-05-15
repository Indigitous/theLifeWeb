require 'spec_helper'

describe InviteRequestGatheringService do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:third_user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:another_group) { create(:group, owner: another_user) }

  let(:invite_request) do
    create(:invite_request, sender: user, group: group, email: another_user.email)
  end

  let(:membership_request) do
    create(:membership_request, sender: third_user, group: another_group)
  end

  let(:invite_requests) { [invite_request, membership_request] }

  let(:service) { described_class.new(another_user) }

  describe '#gather' do
    subject { service.gather }

    it { should be_a_kind_of Array }
    it { should match_array(invite_requests) }
  end
end
