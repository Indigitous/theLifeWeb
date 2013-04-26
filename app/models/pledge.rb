class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :event, counter_cache: true

  validates :user_id, presence: true

  validates :event_id,
    presence: true,
    uniqueness: { scope: :user_id, message: I18n.t('errors.messages.can_not_pray_twice') }

  validate :can_pray_for_event?

  delegate :pledges_count, to: :event, prefix: true

  private

  def can_pray_for_event?
    event_prayer_requested?
    prayer_is_event_creator?
  end

  def event_prayer_requested?
    if event && ! event.prayer_requested
      errors.add(:event, I18n.t('errors.messages.can_not_pray_unless_prayer_requested'))
    end
  end

  def prayer_is_event_creator?
    if event && event.user == user
      errors.add(:event, I18n.t('errors.messages.can_not_pray_for_self_event'))
    end
  end
end
