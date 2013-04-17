FactoryGirl.define do
  factory :friend do
    first_name
    last_name
    email

    threshold

    user
  end
end
