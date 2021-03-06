RSpec::Matchers.define :be_a_my_invite_request_representation do |invite_request|
  match do |json|
    attributes = invite_request.sliced_attributes %w[
      id
      user_id
      group_id
      type
      status
    ]

    accessors = invite_request.sliced_accessors %w[
      sender_full_name
      recipient_email
      recipient_full_name
      group_name
    ]

    response_attributes = attributes.merge(accessors)

    json.should be
    json.should include_attributes(response_attributes)
  end
end
