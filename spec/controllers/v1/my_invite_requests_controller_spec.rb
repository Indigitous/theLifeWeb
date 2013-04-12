require 'spec_helper'

describe V1::MyInviteRequestsController do
  let(:user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:invited_user) { create(:user) }

  let(:invite_request) do
    build(:invite_request, user: user, group: group, email: invited_user.email)
  end
  let(:invite_requests) { [invite_request] }

  it_behaves_like('a controller that requires an authentication')

  before do
    sign_in(invited_user)
  end

  describe '#index' do
    before do
      InviteRequestGatheringService.any_instance.should_receive(:gather) { invite_requests }
    end

    it_behaves_like('a successfull GET request')

    it 'assigns invite_requests' do
      expect(controller.my_invite_requests).to match_array(invite_requests)
    end
  end
end
