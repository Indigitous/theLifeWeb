require 'spec_helper'

describe V1::PledgesController do
  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:params) { { format: :json, event_id: 1 } }
  end

  before { sign_in(create(:user)) }

  describe '#create' do
    let(:event) { stub_model(Event, id: 1) }

    before do
      controller.stub(event: event)
    end

    it 'receives pledge! on the pledged event creating service' do
      PledgedEventCreatingService.any_instance.should_receive(:pledge!)
      post(:create, format: :json, event_id: event.id)
    end

    subject { response }

    context 'when user can pledge to pray for an event' do
      before do
        PledgedEventCreatingService.any_instance.stub(:pledge!).and_return(event)
        post(:create, format: :json, event_id: event.id)
      end

      it { should be_success }
      its(:code) { should eq '201' }
    end

    context "when user can't pledge to pray for an event" do
      before do
        event.stub(errors: [{ pray: ["you can't pray for it"] }])
        PledgedEventCreatingService.any_instance.stub(:pledge!).and_return(event)
        post(:create, format: :json, event_id: event.id)
      end

      it { should_not be_success }
      its(:code) { should eq '422' }
    end
  end
end
