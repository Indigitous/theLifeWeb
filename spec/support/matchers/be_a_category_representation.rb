RSpec::Matchers.define :be_a_category_representation do |category|
  match do |json|
    category_attributes = category.sliced_attributes %w[
      id
      name
    ]

    category_accessors = category.sliced_accessors %w[
      description
    ]

    response_attributes = category_attributes.merge(category_accessors)

    json.should be
    json.should include_attributes(response_attributes)
  end
end
