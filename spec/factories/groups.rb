# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name { Faker::Company.name }
    description

    owner
  end
end
