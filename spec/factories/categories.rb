FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.word }

    after(:build) do |category|
      category.description = Faker::Lorem.sentence
    end
  end
end
