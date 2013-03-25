FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:password) { '123456' }
  sequence(:first_name) { Faker::Name.first_name }
  sequence(:last_name) { Faker::Name.last_name }
end
