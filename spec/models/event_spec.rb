require 'spec_helper'

describe Event do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:friend) }
  it { should validate_presence_of(:activity) }

  it { should have_many(:pledges) }

  describe '#to_s' do
    let!(:event) { create(:event) }
    subject { event.to_s }
    it 'should return event id' do
      subject.should == event.id
    end
  end

  describe '.recent(n)' do
    let!(:event_1) { create(:event) }
    let!(:event_2) { create(:event) }
    let!(:event_3) { create(:event) }
    subject { Event.recent(2) }
    it 'returns n recent activities' do
      subject.should =~ [event_3, event_2]
    end
  end

  describe '#can_pray_for_it?' do
    let(:event) { Event.new(prayer_requested: true) }
    let(:user) { User.new }

    subject { event.can_pray_for_it?(user) }

    it { should be_true }

    context 'when prayer is not requested' do
      let(:event) { Event.new(prayer_requested: false) }
      it { should be_false }
    end

    context 'when user is already event owner' do
      let(:event) { Event.new(prayer_requested: true, user: user) }
      it { should be_false }
    end
  end
end
