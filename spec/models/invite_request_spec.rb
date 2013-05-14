require 'spec_helper'

describe InviteRequest do
  describe 'validations' do
    it { should validate_presence_of :sender }
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
    it { should belong_to :sender }
    it { should belong_to :group }
  end

  describe '#user_name' do
    let(:sender) { stub_model(User, full_name: 'Inviter') }
    let(:recipient) { stub_model(User, full_name: 'Invited') }
    let(:status) { InviteRequest::DELIVERED }

    let(:invite_request) do
      described_class.new do |invite_request|
        invite_request.status = status
        invite_request.sender = sender
      end
    end

    before do
      invite_request.stub(recipient: recipient)
    end

    subject {  invite_request.user_name }

    it { should eq "Inviter" }

    context 'when status is ACCEPTED' do
      let(:status) { InviteRequest::ACCEPTED }

      it { should eq "Invited" }
    end

    context 'when status is REJECTED' do
      let(:status) { InviteRequest::REJECTED }

      it { should eq "Invited" }
    end
  end
end
