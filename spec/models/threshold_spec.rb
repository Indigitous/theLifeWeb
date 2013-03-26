require 'spec_helper'

describe Threshold do
  let(:threshold) { Threshold.first }

  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }
end