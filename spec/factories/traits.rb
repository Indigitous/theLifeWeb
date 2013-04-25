FactoryGirl.define do
  trait :with_image do
    image { File.open(Rails.root.join('spec/fixtures/images/test_image.png')) }
  end
end
