require 'spec_helper'

describe Activity do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :summary }
    it { should validate_presence_of :full_description }
    it { should validate_presence_of :thresholds }
    it { should validate_presence_of :priority }
    it { should ensure_inclusion_of(:priority).in_range(1..10) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many :thresholds }
    it { should belong_to :category }
    it { should have_many(:events) }
  end
end
