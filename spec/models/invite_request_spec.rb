require 'spec_helper'

describe InviteRequest do
  describe 'validations' do
    it { should validate_presence_of :user }
    it { should validate_presence_of :group }
    it { should validate_presence_of :kind }
    it { should ensure_inclusion_of(:kind).in_array(InviteRequest::TYPES) }
    it { should ensure_inclusion_of(:status).in_array(InviteRequest::STATUSES) }

    describe '#members_quota' do
      let(:group) { double(:group, users_count: 9000) }
      let(:invite_request) { described_class.new }

      before do
        invite_request.stub(group: group)
      end

      subject { invite_request }

      it { should_not be_valid }
      it { should have(1).error_on :group }
    end
  end

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :group }
  end
end
