RSpec::Matchers.define :be_a_pledge_representation do |pledge|
  match do |json|
    pledge_attributes = pledge.sliced_attributes %w[
      id
      user_id
      event_id
    ]

    pledge_accessors = pledge.sliced_accessors %w[event_pledges_count]

    response_attributes = pledge_attributes.merge(pledge_accessors)

    json.should be
    json.should include_attributes(response_attributes)
  end
end
