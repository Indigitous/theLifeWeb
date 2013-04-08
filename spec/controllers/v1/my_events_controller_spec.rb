require 'spec_helper'

describe V1::MyEventsController do
  let(:current_user) { create(:user) }

  before { sign_in(current_user) }

  it_behaves_like('a controller that requires an authentication')

  subject { response }

  describe '#index' do
    let(:event) { build :event, user: current_user }
    let(:events) { [event] }

    before do
      EventGatheringService.any_instance.should_receive(:gather) { events }
    end

    it_behaves_like 'a successfull GET request'

    it 'assigns events' do
      expect(controller.my_events).to match_array(events)
    end

  end
end
