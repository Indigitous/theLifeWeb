require 'spec_helper'

describe Group do
  let(:group) { FactoryGirl.create :group }
  subject { group }

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :owner }
    it { should validate_uniqueness_of :name }
  end

  describe 'associations' do
    it { should belong_to :owner }
  end
end