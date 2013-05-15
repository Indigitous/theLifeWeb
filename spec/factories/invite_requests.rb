# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invite_request do
    sender
    group

    email

    factory :membership_request do
      kind InviteRequest::REQUEST_MEMBERSHIP
    end

    trait :accepted do
      status InviteRequest::ACCEPTED
    end

    trait :rejected do
      status InviteRequest::REJECTED
    end
  end
end
