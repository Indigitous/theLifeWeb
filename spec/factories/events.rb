FactoryGirl.define do
  factory :event do
    activity
    friend
    user
  end

  factory :group_event, parent: :event do
    ignore { for_user nil }

    after(:build) do |event, evaluator|
      return unless evaluator.for_user

      FactoryGirl.create :group,
        owner: event.user,
        users: [evaluator.for_user]
    end
  end
end
