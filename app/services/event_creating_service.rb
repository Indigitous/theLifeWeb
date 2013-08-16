class EventCreatingService
  def initialize(event)
    @event = event
    @gcm_service = GCMService.new
  end

  def create
    @event.save &&
    update_friend_threshold &&
    @gcm_service.send_event_notifications(@event, current_user.fellow_group_member)

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
