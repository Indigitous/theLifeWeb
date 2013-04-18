require "spec_helper"

describe InvitationMailer do
  let(:user) { build(:user) }
  let(:group) { build(:group) }
  let(:invite_request) { build(:invite_request, email: 'homer@msn.com', user: user, group: group) }

  describe "#signup_instructions" do
    let(:email) { described_class.signup_instructions(invite_request) }

    it 'has correct subject' do
      email.should have_subject("You have been invited to #{group.name}")
    end

    it 'contains invitation text' do
      email.should have_body_text("%s invited you to join %s" % [user.full_name, group.name])
    end
  end
end
