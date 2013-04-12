FactoryGirl.define do
  factory :group_user do
    sequence(:group_id) { |n| n }
    sequence(:user_id) { |n| n }
  end
end
