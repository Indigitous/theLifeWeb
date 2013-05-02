RSpec::Matchers.define :be_an_invite_request_representation do |invite_request|
  match do |json|
    invite_request_attributes = %w[
      id
      user_id
      group_id
      type
      created_at
    ]


    json.should be
    json.should include_attributes(id: invite_request.id)
    json.should be_a_hash_with_keys(invite_request_attributes)
  end
end
