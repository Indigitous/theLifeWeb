RSpec::Matchers.define :be_a_file do |expected_file|
  match do |response_body|
    response_body_checksum = Digest::MD5.hexdigest(response_body)
    file_checksum = Digest::MD5.hexdigest(expected_file.file.read)

    response_body_checksum.should eq(file_checksum)
  end

  failure_message_for_should do
    'Checksums does not match'
  end

  failure_message_for_should_not do
    'Checksums are match'
  end
end
