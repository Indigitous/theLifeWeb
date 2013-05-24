class V1::ActivitiesController < V1::BaseController
  # include_server_timestamp only: :index # TODO Android 0.81 compatibility; separate data and meta/server_timestamp fields

  expose(:activities) do
    ActivitiesGatheringService.new(params).gather
  end

  def index
    respond_with(activities)
  end
end
