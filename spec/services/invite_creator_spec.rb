require 'spec_helper'

describe InviteCreator do
  let(:user) { create(:user) }
  let(:group) { create(:group, owner: user) }
  let(:params) do
    {
      email: generate(:email),
      group_id: group.id
    }
  end

  let(:invite_creator) { described_class.new(user, params) }

  describe '#create' do
    subject { invite_creator.create }

    context 'when group does not exist' do
      before do
        Group.stub(find_by_id: nil)
      end

      it { should_not be_persisted }
      its(:errors) { should include(:group) }
    end

    context 'when user is not an owner of the group' do
      let(:another_user) { build(:user) }

      before do
        group.stub(owner: another_user)
        invite_creator.stub(group: group)
      end

      it { should_not be_persisted }
      its(:errors) { should include(:user) }
    end

    context 'when email and sms are blank' do
      let(:params) do
        {
          group_id: group.id
        }
      end

      it { should_not be_persisted }
      its(:errors) { should include(:receiver) }
    end

    context 'when user is already a member' do
      before do
        group.users.stub(exists?: true)
        invite_creator.stub(group: group)
      end

      it { should_not be_persisted }
      its(:errors) { should include(:receiver) }
    end

    context 'with valid params' do
      it { should be_persisted }

      it 'sends signup instructions to user' do
        mail = double(:mail)
        mail.should_receive(:deliver)
        InvitationMailer.should_receive(:signup_instructions).and_return(mail)

        invite_creator.create
      end
    end
  end
end
