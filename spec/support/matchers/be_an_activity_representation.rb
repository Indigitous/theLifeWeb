RSpec::Matchers.define :be_an_activity_representation do |activity|
  match do |json|
    activity_attributes = activity.sliced_attributes %w[
      id
      title
      summary
      full_description
      category_id
      priority
    ]

    activity_accessors = activity.sliced_accessors %w[
      threshold_ids
    ]

    response_attributes = activity_attributes.merge(activity_accessors)

    json.should be
    json.should include_attributes(response_attributes)
  end
end
