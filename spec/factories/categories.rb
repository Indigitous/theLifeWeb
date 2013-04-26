FactoryGirl.define do
  factory :category do
    ignore do
      name Faker::Lorem.word
      description Faker::Lorem.sentence
    end

    after(:build) do |category, evaluator|
      category.name = evaluator.name
      category.description = evaluator.description
    end
  end
end
