RSpec::Matchers.define :be_an_event_representation do |event|
  match do |json|
    event_attributes = %w[
      id
      user_id
      friend_id
      activity_id
      prayer_requested
      threshold_id
      created_at
      description
    ]

    json.should be
    json.should include_attributes(id: event.id)
    json.should be_a_hash_with_keys(event_attributes)
  end
end
