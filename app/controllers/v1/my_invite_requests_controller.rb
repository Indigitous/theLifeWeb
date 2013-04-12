class V1::MyInviteRequestsController < ApplicationController
  expose(:my_invite_requests) { InviteRequestGatheringService.new(current_user).gather }

  def index
    respond_with(my_invite_requests, each_serializer: MyInviteRequestSerializer)
  end
end
