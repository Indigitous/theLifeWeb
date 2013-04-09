RSpec::Matchers.define :be_an_activity_representation do |activity|
  match do |json|
    response_attributes = activity.sliced_attributes %w[
      id
      title
      summary
      full_description
      category_id
      priority
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
