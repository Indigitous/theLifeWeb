class V1::EventsController < V1::BaseController
  expose(:events, ancestor: :current_user)
  expose(:event, attributes: :event_params)

  def create
    new_event = EventCreatingService.new(event).create
    respond_with(new_event)
  end

  private

  def event_params
    permitted = [:activity_id, :friend_id, :prayer_requested, :threshold_id]
    params.require(:event).permit(*permitted)
  end
end
