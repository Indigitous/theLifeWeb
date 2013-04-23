require 'spec_helper'

describe Pledge do
  it { should belong_to(:user) }
  it { should belong_to(:event) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:event_id) }

  it do
    should validate_uniqueness_of(:event_id)
      .scoped_to(:user_id)
      .with_message("you can't pray for an event twice")
  end

  describe 'validate pray requester for an event' do
    let(:event) { stub_model(Event, prayer_requested: true) }
    let(:user) { stub_model(User) }
    let(:pledge) { described_class.new(event: event, user: user) }

    before { pledge.valid? }

    subject { pledge.errors[:event_id] }

    it { should be_blank }

    context 'when prayer is not requested' do
      let(:event) { Event.new(prayer_requested: false) }
      it { should include("you can't pray for an event where prayer is not requested") }
    end

    context 'when user is already event owner' do
      let(:event) { Event.new(prayer_requested: true, user: user) }
      it { should include("you can't pray for self event") }
    end
  end
end
