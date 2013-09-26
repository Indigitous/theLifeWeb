class V1::PledgesController < V1::BaseController
  expose(:events) { EventGatheringService.new(current_user).gather }
  expose(:event)

  expose(:pledges, ancestor: :current_user)
  expose(:pledge)

  def create
    pledge.event = event
    new_pledge = PledgeCreatingService.new(pledge).create
    GCMService.new().send_pledge_notifications(current_user, new_pledge.event, current_user.fellow_group_members) if new_pledge

    respond_with(new_pledge)
  end
end
