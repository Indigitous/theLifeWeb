RSpec::Matchers.define :be_a_file_representation do |expected|
  match do |actual|
    actual_hash = Digest::MD5.hexdigest(response.body)
    expected_hash = Digest::MD5.hexdigest(expected.file.read)

    actual_hash.should eq(expected_hash)
  end
end
