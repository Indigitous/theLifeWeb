FactoryGirl.define do
  factory :threshold do
    title { Threshold::TITLES.sample }

    initialize_with do
      Threshold.find_by_title(title) || new(title: title)
    end
  end
end
