# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name { Faker::Company.name }
    description

    owner

    after(:build) do |group|
      group.users << group.owner
    end
  end
end
