class V1::ActivitiesController < V1::BaseController
  expose(:activities) do
    ActivitiesGatheringService.new(params).gather
  end

  def index
    respond_with(activities)
  end
end
