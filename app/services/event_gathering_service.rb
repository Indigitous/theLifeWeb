class EventGatheringService
  def initialize(user)
    @user = user
  end

  def gather(params = {})
    normalize(collect, params)
  end

  private

  def collect
    Event.where(user_id: group_comembers_id.push(@user.id))
  end

  def group_comembers_id
    GroupUser.where(group_id: @user.group_ids).pluck(:user_id)
  end

  def normalize(events, params)
    params = normalize_params(params)
    events = normalize_conditions(events.uniq, params)

    params[:before] ? events.reverse : events
  end

  def normalize_params(params)
    if params[:after].present?
      params[:before] = nil
    end

    params
  end

  def normalize_conditions(events, params)
    if event_id = params[:after] || params[:before]
      events = events.where(["id #{normalize_operator(params)} ?", event_id])
    end

    events.order("id #{normalize_ordering(params)}").limit(20)
  end

  def normalize_operator(params)
    params[:before] ? '<' : '>'
  end

  def normalize_ordering(params)
    params[:before] ? 'ASC' : 'DESC'
  end
end
