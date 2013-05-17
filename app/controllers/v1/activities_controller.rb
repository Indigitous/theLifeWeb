class V1::ActivitiesController < V1::BaseController
  expose(:activities)

  def index
    self.activities = ActivitiesGatheringService.new(params).gather
    respond_with(activities)
  end
end
