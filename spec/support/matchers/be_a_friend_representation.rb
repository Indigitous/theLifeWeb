RSpec::Matchers.define :be_a_friend_representation do |friend|
  match do |json|
    response_attributes = friend.sliced_attributes %w[
      id
      first_name
      last_name
      threshold_id
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
