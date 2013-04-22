class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend
  belongs_to :activity
  belongs_to :threshold

  validates :user,
    :friend,
    :activity,
    presence: true

  delegate :summary, to: :activity
  delegate :first_name, to: :user, prefix: true
  delegate :first_name, to: :friend, prefix: true

  alias_method :user_name, :user_first_name
  alias_method :friend_name, :friend_first_name
  alias_method :description, :summary

  scope :recent, lambda { |n| limit(n).order('id desc') }

  def to_s
    self.id
  end
end
