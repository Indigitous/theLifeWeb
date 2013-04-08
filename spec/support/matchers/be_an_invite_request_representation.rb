RSpec::Matchers.define :be_an_invite_request_representation do |invite_request|
  match do |json|
    response_attributes = invite_request.sliced_attributes %w[
      id
      user_id
      group_id
      type
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
