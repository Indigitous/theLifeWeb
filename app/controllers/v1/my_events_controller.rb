class V1::MyEventsController < V1::BaseController
  expose(:my_events) { EventGatheringService.new(current_user).gather }

  def index
    respond_with(my_events)
  end
end
