require 'spec_helper'

describe GroupUser do
  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :group }
  end

  describe 'group-user pair' do
    let!(:group_user) { create(:group_user, :user_id => 1, :group_id => 1) }
    let(:new_group_user) { build(:group_user, :user_id => 1, :group_id => 1) }
    subject { new_group_user }
    it 'should not be valid if already exist' do
      subject.should_not be_valid
    end
  end

  describe '#to_s' do
    let(:group) { create(:group, :name => "Kung Fu") }
    let(:user) { create(:user, :first_name => "Jacky", :last_name => "Chan") }
    let!(:group_user) { create(:group_user, :user => user, :group => group) }
    subject { group_user.to_s }
    it 'should return user fullname - group name' do
      subject.should == 'Jacky Chan - Kung Fu'
    end
  end
end
