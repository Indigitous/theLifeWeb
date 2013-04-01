class V1::EventsController < ApplicationController
  expose(:events, ancestor: :current_user)
  expose(:event, attributes: :event_params)

  expose(:all_events) { EventGatheringService.new(current_user).gather }

  def create
    event.save
    respond_with(event)
  end

  def index
    respond_with(all_events)
  end

  private

  def event_params
    params.require(:event).permit(:activity_id, :friend_id, :prayer_requested)
  end
end
