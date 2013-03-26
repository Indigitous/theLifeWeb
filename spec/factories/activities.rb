FactoryGirl.define do
  factory :activity do
    title   { Faker::Lorem.word }
    summary { Faker::Lorem.sentence }
    full_description { Faker::Lorem.paragraph }

    category

    thresholds { [Threshold.first] }
  end
end