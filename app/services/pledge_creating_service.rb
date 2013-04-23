class PledgeCreatingService
  def initialize(pledge)
    @pledge = pledge
    @event = pledge.event
    @user = pledge.user
  end

  def create
    Event.transaction do
      unless dup_event.save && @pledge.save
        raise ActiveRecord::Rollback
      end
    end

    @pledge
  end

  private

  def dup_event
    @event.dup.tap do |event|
      event.target_event = @event
      event.user = @user
    end
  end
end
