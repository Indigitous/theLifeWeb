FactoryGirl.define do
  factory :activity do
    title   { Faker::Lorem.word }
    summary { Faker::Lorem.sentence }
    full_description { Faker::Lorem.paragraph }

    # Associate activity with thresholds and category
    after(:build) do |activity|
      # Thresholds first
      thresholds = []
      (1..3).map do
        rand_id = rand(Threshold.count)
        thresholds << Threshold.first(offset: rand_id)
      end
      activity.thresholds << thresholds
      # And category now
      rand_id = rand(Category.count)
      activity.category = Category.first(offset: rand_id)
    end
  end
end