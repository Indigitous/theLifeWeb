require 'spec_helper'

describe V1::PledgesController do
  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:params) { { format: :json, event_id: 1 } }
  end

  before { sign_in(create(:user)) }

  describe '#create' do
    let(:event) { stub_model(Event, id: 1) }
    let(:pledge) { stub_model(Pledge, event: event) }

    before do
      controller.stub(event: event)
      PledgeCreatingService.any_instance.stub(create: pledge)
    end

    it 'receives #create on the pledge creating service' do
      PledgeCreatingService.any_instance.should_receive(:create)
      post(:create, format: :json, event_id: event.id)
    end

    subject { response }

    context 'when user can pledge to pray for an event' do
      before do
        post(:create, format: :json, event_id: event.id)
      end

      it { should be_success }
      its(:code) { should eq '201' }
    end

    context "when user can't pledge to pray for an event" do
      before do
        pledge.stub(errors: [{ event: ["you can't pray for it"] }])
        post(:create, format: :json, event_id: event.id)
      end

      it { should_not be_success }
      its(:code) { should eq '422' }
    end
  end
end
