class V1::ActivitiesController < ApplicationController
  expose(:activities)

  def index
    if params[:threshold_id]
      self.activities = Threshold.find(params[:threshold_id]).activities
    end
    respond_with(activities)
  end
end
