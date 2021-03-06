RSpec::Matchers.define :be_a_group_representation do |group|
  match do |json|
    response_attributes = group.sliced_attributes %w[
      id
      name
      description
      user_id
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
