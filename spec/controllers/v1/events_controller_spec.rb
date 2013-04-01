require 'spec_helper'

describe V1::EventsController do
  let(:current_user) { create(:user) }

  before { sign_in(current_user) }

  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:params) { { activity_id: 1, format: :json } }
  end

  subject { response }

  describe '#create' do

    context 'when params are valid' do
      let(:params) do
        { activity_id: 1, friend_id: 2, format: :json }
      end

      before do
        Event.any_instance.should_receive(:save)
        Event.any_instance.stub(valid?: true)

        post(:create, params)
      end

      it { should be_success }
      its(:code) { should eq '201' }
    end

    context 'when params are not valid' do
      let(:params) { { friend_id: 1, format: :json } }

      before { post(:create, params) }

      it { should_not be_success }
      its(:code) { should eq '422' }
    end
  end

  describe '#index' do
    let(:event) { build :event, user: current_user }
    let(:events) { [event] }

    before do
      EventGatheringService.any_instance.should_receive(:gather) { events }
      get :index, format: :json
    end

    it 'assigns events' do
      expect(controller.all_events).to match_array(events)
    end

    it { should be_success }
    its(:code) { should eq '200' }
  end
end
