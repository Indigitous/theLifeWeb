require 'spec_helper'

describe V1::MyGroupsController do
  let(:current_user) { create(:user) }

  before { sign_in(current_user) }

  it_behaves_like('a controller that requires an authentication')

  subject { response }

  describe '#index' do
    let(:group) { create :group, owner: current_user }
    let(:groups) { [group] }

    before do
      current_user.stub(owned_groups: groups)
    end

    it_behaves_like 'a successfull GET request'

    it 'assigns events' do
      expect(controller.my_groups).to match_array(groups)
    end

  end
end
