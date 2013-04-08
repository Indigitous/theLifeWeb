require 'spec_helper'


describe V1::MyInviteRequestsController do
  let(:user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:invited_user) { create(:user) }

  let(:invite_request) do
    create(:invite_request, user: user, group: group, email: invited_user.email)
  end
  let(:invite_requests) { [invite_request] }

  before do
    invited_user.stub(received_invite_request: invite_requests)

    sign_in(invited_user)
  end

  describe '#index' do
    it_behaves_like 'a successfull GET request'

    it 'assigns invite_requests' do
      expect(controller.invite_requests).to match_array(invite_requests)
    end
  end
end
