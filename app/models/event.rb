class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend
  belongs_to :activity
  belongs_to :threshold
  belongs_to :target_event, class_name: 'Event'

  has_many :pledges
  has_many :pledged_users,
    through: :pledges,
    source: :user

  validates :user,
    :friend,
    :activity,
    presence: true

  delegate :summary, to: :activity, allow_nil: true
  delegate :name, to: :user, prefix: true
  delegate :name, to: :friend, prefix: true

  alias_method :description, :summary

  scope :recent, lambda { |n| limit(n).order('id desc') }

  def to_s
    "Event #{self.id}"
  end
end
