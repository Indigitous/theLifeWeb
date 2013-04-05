class EventGatheringService
  def initialize(user)
    @user = user
  end

  def gather
    normalize(collect)
  end

  private

  def collect
    [].tap do |events|
      events << owned
      events << related
    end
  end

  def normalize(events)
    events.flatten.uniq.sort_by(&:id).reverse
  end

  def owned
    @user.events
  end

  def related
    Event.where(user_id: group_comembers_id)
  end

  def group_comembers_id
    GroupUser.where(group_id: @user.group_ids).pluck(:user_id)
  end
end
