class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :user_id, presence: true

  validates :event_id,
    presence: true,
    uniqueness: { scope: :user_id }

  validate :can_pray_for_event?

  private

  def can_pray_for_event?
    if event && ! event.can_pray_for_it?(user)
      errors.add(:event, I18n.t('errors.messages.can_not_pray_for_event'))
    end
  end
end
