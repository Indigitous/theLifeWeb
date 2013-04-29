class MyEventSerializer < EventSerializer
  attributes :user_name,
    :friend_name,
    :pledges_count,
    :has_pledged,
    :target_event_id

  private

  def has_pledged
    object.pledged_user_ids.include?(current_user.id)
  end
end
