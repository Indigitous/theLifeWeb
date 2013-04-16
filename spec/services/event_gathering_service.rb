require 'spec_helper'

describe EventGatheringService do
  let(:current_user) { create :user }
  let(:other_user) { create :user }
  let(:group_comember) { create :user }

  let!(:event) { create :event, user: current_user }
  let!(:other_event) { create :event, user: other_user }
  let!(:group_event) { create :event, user: group_comember }

  let!(:group) {
    create(:group,
      owner: current_user,
      users: [current_user, group_comember]
    )
  }

  let(:service) { described_class.new(current_user) }

  describe "#gather" do
    subject { service.gather }

    its(:length) { should eq(2) }
    it { should include(event) }
    it { should include(group_event) }
    it { should_not include(other_event) }

    describe 'events after the specified' do
      let(:events) { create_list(:event, 3, user: current_user) }
      let(:params) { { after: events.first.id } }

      subject { service.gather(params) }

      it { should eq(events[1..-1].reverse) }

      context 'when before specified in params' do
        let(:params) { { after: events.first.id, before: events.first.id } }

        it { should eq(events[1..-1].reverse) }
      end
    end

    describe 'events before the specified' do
      let(:events) { create_list(:event, 3, user: current_user) }
      let(:params) { { before: events.first.id } }

      subject { service.gather(params) }

      it { should eq([group_event, event]) }
    end
  end
end
