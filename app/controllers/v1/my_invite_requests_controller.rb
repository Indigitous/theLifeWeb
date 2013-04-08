class V1::MyInviteRequestsController < ApplicationController
  expose(:invite_requests)

  def index
    self.invite_requests = current_user.received_invite_requests
    respond_with(invite_requests)
  end
end
