FactoryGirl.define do
  factory :user, aliases: [:owner, :sender] do
    email
    password
    first_name
    last_name
    mobile
    locale
  end
end
