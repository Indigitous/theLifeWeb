class EventGatheringService
  DEFAULT_LIMIT = 20

  def initialize(user)
    @user = user
  end

  def gather(params = {})
    normalize(collect, params)
  end

  private

  def collect
    Event
      .where(user_id: group_comembers_id.push(@user.id))
      .includes(:user, :friend, :activity)
  end

  def group_comembers_id
    GroupUser.where(group_id: @user.group_ids).pluck(:user_id)
  end

  def normalize(events, params)
    params = normalize_params(params)
    events = normalize_conditions(events.uniq, params)

    params[:after] ? events.reverse : events
  end

  def normalize_params(params)
    params[:after] = params[:after].presence
    params[:before] = params[:before].presence
    params[:before] = nil if params[:after]

    params
  end

  def normalize_conditions(events, params)
    if event_id = params[:after] || params[:before]
      events = events.where(["id #{normalize_operator(params)} ?", event_id])
    end

    events
      .order("id #{normalize_ordering(params)}")
      .limit(params[:max] || DEFAULT_LIMIT)
  end

  def normalize_operator(params)
    params[:after] ? '>' : '<'
  end

  def normalize_ordering(params)
    params[:after] ? 'ASC' : 'DESC'
  end
end
