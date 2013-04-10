require 'spec_helper'

describe V1::MyFriendsController do
  let(:current_user) { create(:user) }

  before do
    sign_in(current_user)
  end

  it_behaves_like 'a controller that requires an authentication'

  subject { response }

  describe '#index' do
    let(:friend) { create :friend, user: current_user }
    let(:friends) { [friend] }

    it_behaves_like 'a successfull GET request'

    it 'assigns friends' do
      expect(controller.my_friends).to match_array(friends)
    end
  end
end
