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
    let(:params) { { first_name: 'Homer', last_name: 'Simpson', format: :json } }

    before do
      post :create, params
    end

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
