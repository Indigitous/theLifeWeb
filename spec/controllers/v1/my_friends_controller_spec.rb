require 'spec_helper'

describe V1::MyFriendsController do
  let(:current_user) { stub_model(User) }

  before do
    sign_in(current_user)
  end

  it_behaves_like 'a controller that requires an authentication'

  subject { response }

  describe '#index' do
    let(:friend) { stub_model(Friend, user: current_user) }
    let(:friends) { [friend] }

    before do
      current_user.stub(friends: friends)
    end

    it_behaves_like 'a successfull GET request'

    it 'assigns friends' do
      expect(controller.my_friends).to match_array(friends)
    end
  end
end
