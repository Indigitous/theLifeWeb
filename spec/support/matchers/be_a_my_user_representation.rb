RSpec::Matchers.define :be_a_my_user_representation do |user|
  match do |json|
    response_attributes = user.sliced_attributes %w[
      email
      first_name
      last_name
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
