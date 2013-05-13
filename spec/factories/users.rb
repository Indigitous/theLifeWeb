FactoryGirl.define do
  factory :user, aliases: [:owner] do
    email
    password
    first_name
    last_name
    mobile
    locale
    apple_token
  end
end
