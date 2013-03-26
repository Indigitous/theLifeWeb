require 'spec_helper'

describe Activity do
  describe 'validations' do
    it { should validate_presence_of  :title }
    it { should validate_presence_of  :summary }
    it { should validate_presence_of  :full_description }
    it { should validate_presence_of  :thresholds}
  end

  describe 'associations' do
    it { should have_and_belong_to_many :thresholds }
    it { should belong_to :category}
  end
end