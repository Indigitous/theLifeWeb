class EventGatheringService
  def initialize(user)
    @user = user
    @events = []
  end

  def gather
    gather_owned_events
    gather_related_events

    @events.flatten.uniq.sort_by(&:id).reverse
  end

  private

  def gather_owned_events
    @events << @user.events
  end

  def gather_related_events
    group_comembers_id = GroupUser.where(group_id: @user.group_ids).pluck(:user_id)
    @events << Event.where(user_id: group_comembers_id)
  end
end
