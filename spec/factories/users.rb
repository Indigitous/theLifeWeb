FactoryGirl.define do
  factory :user, aliases: [:owner, :sender] do
    email
    password
    first_name
    last_name
    mobile
    locale
    android_device
  end

  factory :android_device, class: Gcm::Device do
    registration_id { Faker::PhoneNumber.phone_number }
  end
end
