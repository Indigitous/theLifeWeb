class V1::MyEventsController < V1::BaseController
  expose(:my_events) { EventGatheringService.new(current_user).gather(params) }

  def index
    respond_with(my_events, each_serializer: MyEventSerializer)
  end
end
