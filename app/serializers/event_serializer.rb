class EventSerializer < BaseSerializer
  attributes :id, :user_id, :friend_id,
    :activity_id, :description, :prayer_requested

  def description
    object.description
  end
end
