require 'spec_helper'

describe Setting do
  it { should validate_presence_of(:key) }
  it { should validate_presence_of(:value) }
end
