RSpec::Matchers.define :be_a_my_user_representation do |my_user|
  match do |json|
    my_user_attributes = %w[
      email
      first_name
      last_name
      mobile
      image
      thumbnail
    ]

    json.should be
    json.should be_a_hash_with_keys(my_user_attributes)
  end
end
