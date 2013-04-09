require 'spec_helper'

describe Friend do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
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
end
