FactoryGirl.define do
  factory :friend do
    first_name
    last_name
    email
    mobile

    threshold

    user
  end
end
