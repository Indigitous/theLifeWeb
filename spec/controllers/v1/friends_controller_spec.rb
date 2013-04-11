require 'spec_helper'

describe V1::FriendsController do
  let(:current_user) { create :user }
  before { sign_in(current_user) }

  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :create }
    let(:params) { { first_name: 'Homer', format: :json } }
  end

  subject { response }

  describe '#create' do
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

  describe '#destroy' do
    let(:friend) { create :friend, user: current_user }
    let(:delete_params) { { id: friend.id, format: :json } }

    describe 'when all params are valid' do
      before do
        Friend.any_instance.should_receive(:destroy)
      end

      it_behaves_like 'a successfull DELETE request' do
        let(:params) { delete_params}
      end
    end

    describe 'when friend is not a friend of current user' do
      before do
        FriendDeletionService.any_instance.stub(delete: false)
        Friend.any_instance.should_not_receive(:destroy)

        delete :destroy, params
      end

      it_behaves_like 'a successfull DELETE request' do
        let(:params) { delete_params}
      end
    end
  end
end
