require 'spec_helper'

describe V1::FriendsController do
  before do
    sign_in(create(:user))
  end

  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:params) { { first_name: 'Homer', format: :json } }
  end

  describe '#create' do

    subject { response }

    context 'when params are valid' do
      let(:params) { attributes_for(:friend, threshold_id: 1) }

      before do
        Friend.any_instance.should_receive(:save)
        Friend.any_instance.stub(valid?: true)

        post(:create, params.merge(format: :json))
      end

      it { should be_success }
      its(:code) { should eq '201' }
    end

    context 'when params are not valid' do
      let(:params) { { first_name: 'Homer', format: :json } }

      before { post(:create, params) }

      it { should_not be_success }
      its(:code) { should eq '422' }
    end
  end
end
