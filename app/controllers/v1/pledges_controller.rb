class V1::PledgesController < V1::BaseController
  expose(:events, ancestor: :current_user)
  expose(:event)

  def create
    pledged_event = PledgedEventCreatingService.new(event).pledge!
    respond_with(pledged_event)
  end
end
