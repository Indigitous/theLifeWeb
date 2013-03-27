require 'spec_helper'

describe V1::EventsController do
  let(:current_user) { FactoryGirl.create(:user) }

  before { sign_in(current_user) }

  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:params) { { activity_id: 1, format: :json } }
  end

  describe '#create' do
    let(:activity_id) { FactoryGirl.create(:activity).id }
    let(:friend_id) { FactoryGirl.create(:friend, user: current_user).id }

    let(:params) do
      { activity_id: activity_id, friend_id: friend_id, format: :json }
    end

    before { post(:create, params) }

    subject { response }

    it { should be_success }
    its(:code) { should eq '201' }

    context 'when params are not valid' do
      let(:params) { { friend_id: '1', format: :json } }

      it { should_not be_success }
      its(:code) { should eq '422' }
    end
  end
end
