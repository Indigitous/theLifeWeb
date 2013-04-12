# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invite_request do
    user
    group

    email

    factory :membership_request do
      kind InviteRequest::REQUEST_MEMBERSHIP
    end
  end
end
