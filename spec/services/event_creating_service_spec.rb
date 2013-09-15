require 'spec_helper'

describe EventCreatingService do
  describe '#create' do
    let(:event) { double(:event) }
    let(:user) { create :user }

    subject { EventCreatingService.new(user, event) }

    it 'creates an event' do
      event.should_receive(:save)
      subject.create
    end

    describe "updates friend's threshold" do
      let(:new_contact) { double(:new_contact_threshold, id: 1)  }
      let(:trusting) { double(:trusting_threshold, id: 2)  }
      let(:friend) { double(:friend, threshold: new_contact ) }
      let(:event) do
        double :event,
          friend: friend,
          threshold_id: trusting.id,
          threshold: trusting
      end

      context 'when event is not valid' do
        before { event.stub(save: false) }

        it "skips updating friend's threshold" do
          friend.should_not_receive('update_attributes!')
          subject.create
        end
      end

      context 'when event is valid' do
        before { event.stub(save: true) }

        it "updates friend's threshold" do
          friend.should_receive('update_attributes!').with(threshold: trusting)
          subject.create
        end
      end
    end
  end
end
