FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  sequence(:password) { '123456' }
  sequence(:post_id) { '1' }
end
