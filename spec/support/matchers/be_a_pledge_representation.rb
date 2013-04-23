RSpec::Matchers.define :be_a_pledge_representation do |pledge|
  match do |json|
    pledge_attributes = pledge.sliced_attributes %w[
      id
      user_id
      event_id
    ]

    json.should be
    json.should include_attributes(pledge_attributes)
  end
end
