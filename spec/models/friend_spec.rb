require 'spec_helper'

describe Friend do
  it { validate_presence_of(:first_name) }
  it { validate_presence_of(:last_name) }
  it { validate_presence_of(:user) }
end
