# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invite_request do
    user
    group

    receiver { generate(:email) }
  end
end
