class EventSerializer < BaseSerializer
  attributes :id,
    :user_id,
    :friend_id,
    :activity_id,
    :description,
    :threshold_id,
    :prayer_requested,
    :created_at
end
