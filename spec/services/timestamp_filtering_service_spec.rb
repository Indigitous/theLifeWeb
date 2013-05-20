require 'spec_helper'

describe TimestampFilteringService do
  let(:timestamp) { 'a' }
  let(:service) { described_class.new(resources, timestamp) }
  let(:resources) { double(:resources, where: filtered_resources) }
  let(:filtered_resources) { double(:filtered_resources) }

  before do
    resources.stub_chain(:klass, :table_name).and_return('resources')
  end

  it "doesn't filter by timestamp" do
    resources.should_not_receive(:where)
    service.filter
  end

  it 'returns original resources' do
    service.filter.should eq(resources)
  end

  context 'when timestamp is given' do
    let(:timestamp) { 1.second.ago.to_i }

    it 'filters by timestamp' do
      resources.should_receive(:where)
        .with("resources.updated_at > ?", Time.at(timestamp))

      service.filter
    end

    it 'returns filtered scope' do
      service.filter.should eq(filtered_resources)
    end
  end
end
