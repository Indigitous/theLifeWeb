class EventSerializer < BaseSerializer
  attributes :id,
    :user_id,
    :friend_id,
    :activity_id,
    :description,
    :threshold_id,
    :prayer_requested,
    :time

  def time
    object.created_at.to_s(:long)
  end
end
