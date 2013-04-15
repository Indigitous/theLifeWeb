RSpec::Matchers.define :be_a_my_group_representation do |group|
  match do |json|
    attributes = group.sliced_attributes %w[
      id
      name
      description
      user_id
    ]

    accessors = group.sliced_accessors %w[
      member_ids
    ]

    response_attributes = attributes.merge(accessors)

    json.should be
    json.should include_attributes(response_attributes)
  end
end
