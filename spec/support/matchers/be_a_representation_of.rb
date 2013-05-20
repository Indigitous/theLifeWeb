RSpec::Matchers.define :be_a_representation_of do |object|
  match do |actual|
    actual['id'].should eq(object.id)
  end
end
