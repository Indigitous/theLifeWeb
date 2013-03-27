FactoryGirl.define do
  factory :friend do
    first_name
    last_name

    threshold { Threshold.first }

    user
  end
end
