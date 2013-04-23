require 'spec_helper'

describe PledgeCreatingService do
  describe '#create' do
    let(:current_user) { double(:user) }

    let(:event) { double(:event, id: 1234) }
    let(:duplicated_event) { double(:duplicated_event).as_null_object }
    let(:pledge) { double(:pledge, event: event, user: current_user) }

    before do
      event.stub(dup: duplicated_event)
      pledge.stub(save: true)
    end

    let(:service) { described_class.new(pledge) }

    it 'saves a pledge' do
      pledge.should_receive(:save)
      service.create
    end

    context 'event duplication' do
      it 'duplicates an event' do
        event.should_receive(:dup)
        service.create
      end

      it "updates user on duplicated event" do
        duplicated_event.should_receive(:user=).with(current_user)
        service.create
      end

      it 'sets target event id for a duplicated event' do
        duplicated_event.should_receive(:target_event=).with(event)
        service.create
      end

      it 'saves a duplicated event' do
        duplicated_event.should_receive(:save)
        service.create
      end
    end
  end
end
