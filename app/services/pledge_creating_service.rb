class PledgeCreatingService
  attr_reader :pledge

  delegate :event, :user, to: :pledge

  def initialize(pledge)
    @pledge = pledge
  end

  def create
    if pledge.save
      event.reload
      dup_event.save!
    end

    pledge
  end

  private

  def dup_event
    event.dup.tap do |new_event|
      new_event.target_event = event
      new_event.user = user
    end
  end
end
