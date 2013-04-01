require 'spec_helper'

describe Friend do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:threshold) }

  it { should have_many(:events) }
end
