require 'spec_helper'

describe Pledge do
  it { should belong_to(:user) }
  it { should belong_to(:event) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:event_id) }

  it { should validate_uniqueness_of(:event_id).scoped_to(:user_id) }

  describe 'validate pray requester for an event' do
    let(:event) { stub_model(Event) }
    let(:user) { stub_model(User) }
    let(:pledge) { described_class.new(event: event, user: user) }

    subject { pledge.errors[:event] }

    context "when can't pray for an event" do
      before do
        event.stub(can_pray_for_it?: false)
        pledge.valid?
      end

      it { should include("you can't pray for an event") }
    end

    context "when can pray for an event" do
      before do
        event.stub(can_pray_for_it?: true)
        pledge.valid?
      end

      it { should be_blank }
    end
  end
end
