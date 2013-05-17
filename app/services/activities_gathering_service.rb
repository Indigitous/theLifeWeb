class ActivitiesGatheringService
  def initialize(params)
    @params = params
  end

  def gather
    filter_activities_by_threshold_id &&
    filter_activities_by_timestamp

    @activities
  end

  private

  def filter_activities_by_threshold_id
    if @params[:threshold_id].present?
      @activities = Threshold.find(@params[:threshold_id]).activities
    else
      @activities = Activity.scoped
    end
  end

  def filter_activities_by_timestamp
    if @params[:timestamp].present?
      @activities = @activities.where("updated_at > ?",
        Time.at(@params[:timestamp].to_i)
      )
    end
  end
end
