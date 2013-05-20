class ActivitiesGatheringService
  def initialize(params)
    @params = params
    @activities = Activity.scoped
  end

  def gather
    filter_activities_by_threshold_id
    filter_activities_by_timestamp

    @activities
  end

  private

  def filter_activities_by_threshold_id
    if threshold_id
      @activities = Activity
        .joins(:thresholds)
        .where('thresholds.id' => threshold_id)
    end
  end

  def filter_activities_by_timestamp
    if @params[:timestamp].present?
      @activities = @activities.where(
        "activities.updated_at > ?", Time.at(@params[:timestamp].to_i)
      )
    end
  end

  def threshold_id
    @params[:threshold_id].presence
  end
end
