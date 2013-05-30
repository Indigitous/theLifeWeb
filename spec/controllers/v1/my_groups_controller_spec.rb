require 'spec_helper'

describe V1::MyGroupsController do
  let(:current_user) { stub_model(User) }

  before do
    sign_in(current_user)
  end

  it_behaves_like('a controller that requires an authentication')

  describe '#index' do
    let(:group) { stub_model(Group, owner: current_user) }
    let(:groups) { [group] }

    before do
      current_user.stub(groups: groups)
    end

    it_behaves_like 'a successfull GET request'

    it 'assigns groups' do
      expect(controller.my_groups).to match_array(groups)
    end

  end
end
