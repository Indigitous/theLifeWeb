FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:password) { '123456' }
  sequence(:password_confirmation) { '123456' }
  sequence(:first_name) { Faker::Name.first_name }
  sequence(:last_name) { Faker::Name.last_name }
  sequence(:description) { Faker::Company.catch_phrase }
  sequence(:mobile) { Faker::PhoneNumber.phone_number }
  sequence(:locale) { 'en' }
end
