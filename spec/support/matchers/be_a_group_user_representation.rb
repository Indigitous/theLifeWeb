RSpec::Matchers.define :be_a_group_user_representation do |group_user|
  match do |json|
    response_attributes = group_user.sliced_attributes %w[
      user_id
      group_id
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
