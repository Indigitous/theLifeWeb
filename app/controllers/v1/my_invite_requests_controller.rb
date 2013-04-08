class V1::MyInviteRequestsController < ApplicationController
  expose(:my_invite_requests) { current_user.received_invite_requests }

  def index
    respond_with(my_invite_requests)
  end
end
