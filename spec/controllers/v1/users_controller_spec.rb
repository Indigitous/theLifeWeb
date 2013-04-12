require 'spec_helper'

describe V1::UsersController do
  let(:current_user) { create :user }
  let(:group) { create :group, owner: current_user }
  let(:base_params) { { group_id: group.id, format: :json } }

  before do
    sign_in(current_user)
    Group.any_instance.stub(owner: current_user)
    current_user.stub(owned_groups: group)
    current_user.stub(groups: group)
  end

  it_behaves_like('a controller that requires an authentication') do
    let(:params) { base_params }
  end

  subject { response }

  describe "#index" do
    let(:users) { [current_user] }

    before do
      Group.any_instance.stub(:users) { double(scoped: users) }
    end

    it_behaves_like 'a successfull GET request' do
      let(:params) { base_params }
    end

    it 'assigns only group users and not the others' do
      expect(controller.users).to match_array(users)
    end
  end

  describe "#destroy" do
    let(:other_user) { create :user, groups: [group] }
    let(:delete_params) { base_params.merge(id: other_user.id) }

    describe "when user isn't a member or current_user is not a leader" do
      before do
        GroupUserDeletionService.any_instance.stub(exclude: false)

        delete :destroy, delete_params
      end

      it_behaves_like 'a successfull DELETE request' do
        let(:params) { delete_params }
      end

    end

    describe 'when current user is an owner and user is a member of a group' do
      before do
        GroupUserDeletionService.any_instance.stub(exclude: true)

        delete :destroy, delete_params
      end

      it_behaves_like 'a successfull DELETE request' do
        let(:params) { delete_params }
      end
    end
  end
end
