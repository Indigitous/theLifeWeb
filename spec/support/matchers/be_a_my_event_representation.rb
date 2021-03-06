RSpec::Matchers.define :be_a_my_event_representation do |event|
  match do |json|
    event_attributes = %w[
      id
      user_id
      friend_id
      activity_id
      prayer_requested
      threshold_id
      target_event_id
      pledges_count
      has_pledged
      description
      user_name
      friend_name
      created_at
    ]

    expect(json).to be
    expect(json).to include_attributes(id: event.id)
    expect(json).to be_a_hash_with_keys(event_attributes)
  end
end
