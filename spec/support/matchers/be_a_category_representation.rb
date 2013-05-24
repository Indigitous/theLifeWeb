RSpec::Matchers.define :be_a_category_representation do |category|
  match do |json|
    category_attributes = %w[
      id
      name
      description
    ]

    json.should be
    json.should include_attributes(id: category.id)
    json.should be_a_hash_with_keys(category_attributes)
  end
end
