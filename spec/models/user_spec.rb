require 'spec_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'associations' do
    it { should have_many :friends }
    it { should have_many :events }
    it { should have_many :groups }
    it { should have_many :owned_groups }
    it { should have_many :invite_requests }
    it { should have_many :pledges }
  end

  describe '#to_s' do
    let!(:user) { create(:user, first_name: 'Adrian', last_name: 'Teh') }
    subject { user.to_s }
    it 'should return firstname and lastname' do
      subject.should == 'Adrian Teh'
    end
  end
end
