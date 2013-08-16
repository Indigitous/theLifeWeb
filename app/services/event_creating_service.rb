class EventCreatingService
  def initialize(user, event)
    @user, @event = user, event
    @gcm_service = GCMService.new
  end

  def create
    @event.save &&
    update_friend_threshold &&
    @gcm_service.send_event_notifications(@event, @user.fellow_group_members)

    @event
  end

  private

  # will return true on successful update
  def update_friend_threshold
    friend = @event.friend

    if @event.threshold_id
      friend.update_attributes!(threshold: @event.threshold)
    end
  end
end
