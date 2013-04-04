require 'spec_helper'

describe V1::UsersController do
  let(:current_user) { create :user }
  let(:users) { [current_user] }

  let(:group) { create :group }

  let(:base_params) { { group_id: group.id, format: :json } }

  before do
    Group.any_instance.stub(:users) { double(scoped: users) }

    sign_in(current_user)
    get :index, base_params
  end

  it_behaves_like('a controller that requires an authentication') do
    let(:params) { base_params }
  end

  describe "#index" do
    subject { response }

    it_behaves_like 'a successfull GET request' do
      let(:params) { base_params }
    end

    it 'assigns only group users and not the others' do
      expect(controller.users).to match_array(users)
    end
  end
end
