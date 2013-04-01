class V1::EventsController < ApplicationController
  expose(:events, ancestor: :current_user)
  expose(:event, attributes: :event_params)

  def create
    event.save
    respond_with(event)
  end

  private

  def event_params
    params.require(:event).permit(:activity_id, :friend_id, :prayer_requested)
  end
end
