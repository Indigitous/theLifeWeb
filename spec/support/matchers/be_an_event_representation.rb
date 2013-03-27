RSpec::Matchers.define :be_an_event_representation do |event|
  match do |json|
    response_attributes = event.sliced_attributes %w[
      id
      activity_id
      friend_id
      prayer_requested
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
