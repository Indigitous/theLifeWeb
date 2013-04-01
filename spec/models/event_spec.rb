require 'spec_helper'

describe Event do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:friend) }
  it { should validate_presence_of(:activity) }
end
