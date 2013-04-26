FactoryGirl.define do
  factory :category do
    after(:build) do |category|
      category.name = Faker::Lorem.word
      category.description = Faker::Lorem.sentence
    end
  end
end
