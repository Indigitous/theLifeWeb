class InvitationMailer < ActionMailer::Base
  default from: 'theLife <thelifeapp@srv1.thelifeapp.com>'

  def signup_instructions(invite_request)
    @sender, @group = invite_request.sender, invite_request.group
    @recipient_email = invite_request.email
    @invitation_locales = [:en, :fr]

    mail to: @recipient_email,
      subject: 'test laVie Mobile / theLife Mobile App Beta'
  end
end
