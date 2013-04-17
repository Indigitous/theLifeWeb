class EventCreatingService
  def initialize(event)
    @event = event
  end

  def create
    update_friend_threshold if @event.save
    @event
  end

  private

  def update_friend_threshold
    friend = @event.friend

    if @event.threshold_id
      friend.update_attributes!(threshold: @event.threshold)
    end
  end
end
