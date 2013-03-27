RSpec::Matchers.define :have_error do |expected|
  match do |actual|
    errors = actual['errors'] || []
    errors[@field] && errors[@field].include?(expected)
  end

  chain :on do |field|
    @field = field
  end

  failure_message_for_should do |actual|
    "expected #{actual} to have error \"#{expected}\" on #{@field}"
  end
end
