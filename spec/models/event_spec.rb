require 'spec_helper'

describe Event do
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:friend) }
  it { should validate_presence_of(:activity) }

  describe '#to_s' do
    let!(:event) { create(:event) }
    subject { event.to_s }
    it 'should return event id' do
      subject.should == event.id
    end
  end
end
