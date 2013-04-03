require 'spec_helper'

describe EventGatheringService do
  let!(:current_user) { create :user }
  let!(:other_user) { create :user }
  let!(:group_comember) { create :user }

  let!(:event) { create :event, user: current_user }
  let!(:other_event) { create :event, user: other_user }
  let!(:group_event) { create :event, user: group_comember }

  let!(:group) {
    create(:group,
      owner: current_user,
      users: [current_user, group_comember]
    )
  }

  describe ".gather" do
    subject { EventGatheringService.new(current_user).gather }

    its(:size) { should eq(2) }
    it { should include(event) }
    it { should include(group_event) }
    it { should_not include(other_event) }
  end
end