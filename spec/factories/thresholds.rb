FactoryGirl.define do
  sequence :title do |n|
    Threshold::TITLES[n-1]
  end

  factory :threshold do
    title
  end
end