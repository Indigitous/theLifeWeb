FactoryGirl.define do
  factory :user, aliases: [:owner, :sender] do
    email
    password
    first_name
    last_name
    mobile
    locale
    apple_token
  end
end
