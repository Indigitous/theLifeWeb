FactoryGirl.define do
  factory :user, aliases: [:owner] do
    email
    password
    first_name
    last_name
    mobile
  end
end
