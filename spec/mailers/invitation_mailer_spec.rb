require "spec_helper"

describe InvitationMailer do
  let(:user) { double(:user, full_name: 'Bart Simpson') }
  let(:group) { double(:group, name: 'D12') }
  let(:invite_request) { double(:invite_request, email: 'homer@msn.com', sender: user, group: group) }

  describe "#signup_instructions" do
    let(:email) { described_class.signup_instructions(invite_request) }

    it 'has correct subject' do
      email.should have_subject("test laVie Mobile / theLife Mobile App Beta")
    end

    describe 'invitation text' do
      it 'on english' do
        email.should have_body_text(
          "#{user.full_name} has invited you to join the beta test of theLife Mobile App!"
        )
      end

      it 'on french' do
        email.should have_body_text(
          "#{user.full_name} vous a invit&eacute; &agrave; vous joindre au test b&ecirc;ta de laVie Mobile."
        )
      end
    end

    it 'contains link to application' do
      email.should have_body_text(
        "https://play.google.com/store/apps/details?id=com.p2c.thelife"
      )
    end
  end
end
