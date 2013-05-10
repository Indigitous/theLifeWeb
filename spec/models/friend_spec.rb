require 'spec_helper'

describe Friend do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:threshold) }

  it { should have_many(:events) }

  describe '#to_s' do
    let!(:friend) { create(:friend, first_name: 'Adrian', last_name: 'Teh') }

    subject { friend.to_s }
    it 'should return firstname and lastname' do
      subject.should == 'Adrian Teh'
    end
  end

  describe '.recent(n)' do
    let!(:friend_1) { create(:friend) }
    let!(:friend_2) { create(:friend) }
    let!(:friend_3) { create(:friend) }
    subject { Friend.recent(2) }
    it 'returns n recent friends' do
      subject.should =~ [friend_3, friend_2]
    end
  end
end
