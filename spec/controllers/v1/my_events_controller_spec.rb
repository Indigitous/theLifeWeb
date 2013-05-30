require 'spec_helper'

describe V1::MyEventsController do
  let(:current_user) { stub_model(User) }

  before { sign_in(current_user) }

  it_behaves_like('a controller that requires an authentication')

  subject { response }

  describe '#index' do
    let(:event) { stub_model(Event, user: current_user, friend: stub_model(Friend)) }
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
