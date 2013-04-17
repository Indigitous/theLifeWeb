FactoryGirl.define do
  factory :friend do
    first_name
    last_name
    email
    mobile { Faker::PhoneNumber.phone_number }

    threshold

    user
  end
end
