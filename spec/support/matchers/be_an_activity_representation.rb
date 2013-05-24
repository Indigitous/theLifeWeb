RSpec::Matchers.define :be_an_activity_representation do |activity|
  match do |json|
    activity_attributes = %w[
      id
      title
      summary
      full_description
      category_id
      priority
      has_threshold
      threshold_ids
    ]

    json.should be
    json.should include_attributes(id: activity.id)
    json.should be_a_hash_with_keys(activity_attributes)
  end
end
