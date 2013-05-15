require 'spec_helper'

describe BaseSerializer do
  subject { BaseSerializer.new(object) }

  describe '#created_at' do
    let(:object) { double(:object, created_at: time) }
    let(:time) { Time.now }

    its(:created_at) { should eq time.to_i }
  end

  describe '#updated_at' do
    let(:object) { double(:object, updated_at: time) }
    let(:time) { Time.now }

    its(:updated_at) { should eq time.to_i }
  end
end
