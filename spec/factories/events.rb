FactoryGirl.define do
  factory :event do
    activity
    friend
    user
  end

  factory :group_event, parent: :event do
    ignore { group_users [] }

    after(:build) do |event, evaluator|
      return if evaluator.group_users.blank?

      FactoryGirl.create :group,
        owner: event.user,
        users: evaluator.group_users.push(event.user)
    end
  end
end
