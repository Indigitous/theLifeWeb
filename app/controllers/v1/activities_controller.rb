class V1::ActivitiesController < V1::BaseController
  include_server_timestamp only: :index

  expose(:activities) do
    ActivitiesGatheringService.new(params).gather
  end

  def index
    respond_with(activities)
  end
end
