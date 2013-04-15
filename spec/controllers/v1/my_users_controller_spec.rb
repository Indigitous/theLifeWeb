require 'spec_helper'

describe V1::MyUsersController do
  let(:current_user) { create(:user) }
  let(:base_params) { { id: current_user.id, format: :json } }

  before do
    sign_in(current_user)
  end

  it_behaves_like('a controller that requires an authentication') do
    let(:action) { :show }
    let(:params) { base_params }
  end

  describe '#show' do
    before do
      get :show, base_params
    end

    it_behaves_like('a successfull GET request') do
      let(:action) { :show }
      let(:params) { base_params }
    end

    it 'assigns my_user' do
      expect(controller.my_user).to eq(current_user)
    end
  end
end
