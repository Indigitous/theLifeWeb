require 'spec_helper'

describe GroupSearchingService do
  let!(:first_group) { create :group, name: 'The first' }
  let!(:second_group) { create :group, description: 'Description of the second' }

  let(:service) { described_class.new(query) }

  describe "#find_all_matching" do
    subject { service.find_all_matching }

    context 'when group name matches given query' do
      let(:query) { 'first' }

      it { should be_a_kind_of Array }
      its(:size) { should eq(1) }
      it { should include(first_group) }
    end

    context 'when group description matches given query' do
      let(:query) { 'second' }

      it { should be_a_kind_of Array }
      its(:size) { should eq(1) }
      it { should include(second_group) }
    end

    context 'when both name and description matches given query' do
      let(:query) { 'first second' }

      it { should be_a_kind_of Array }
      its(:size) { should eq(2) }
      it { should include(first_group, second_group) }
    end

    context 'when group name or description does not match given query' do
      let(:query) { 'third' }

      it { should be_a_kind_of Array }
      it { should be_empty }
    end
  end
end
