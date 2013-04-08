class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend
  belongs_to :activity

  validates :user,
    :friend,
    :activity,
    presence: true

  delegate :summary, to: :activity

  alias_method :description, :summary
end
