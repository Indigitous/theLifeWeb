require 'spec_helper'

describe V1::FriendsController do
  before do
    sign_in(FactoryGirl.create(:user))
  end

  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:params) { { first_name: 'Homer', format: :json } }
  end

  describe '#create' do
    let(:threshold_id) { Threshold.first.id }

    let(:params) do
      FactoryGirl.attributes_for(:friend, threshold_id: threshold_id)
        .merge(format: :json)
    end

    before { post(:create, params) }

    subject { response }

    it { should be_success }
    its(:code) { should eq '201' }

    context 'when params are not valid' do
      let(:params) { { first_name: 'Homer', format: :json } }

      it { should_not be_success }
      its(:code) { should eq '422' }
    end
  end
end
