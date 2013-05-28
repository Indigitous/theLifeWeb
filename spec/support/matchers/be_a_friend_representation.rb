RSpec::Matchers.define :be_a_friend_representation do |friend|
  match do |json|
    friend_attributes = %w[
      id
      first_name
      last_name
      email
      mobile
      threshold_id
      image
      thumbnail
    ]

    json.should be
    json.should include_attributes(id: friend.id)
    json.should be_a_hash_with_keys(friend_attributes)
  end
end
