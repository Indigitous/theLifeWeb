FactoryGirl.define do
  factory :activity do
    ignore do
      title   { Faker::Lorem.word }
      summary { Faker::Lorem.sentence }
      full_description
    end

    category
    thresholds { [FactoryGirl.create(:threshold)] }
    has_threshold { false }

    after(:build) do |activity, evaluator|
      activity.title = evaluator.title
      activity.summary = evaluator.summary
      activity.full_description = evaluator.full_description
    end
  end
end
