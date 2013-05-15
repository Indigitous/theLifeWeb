class InvitationMailer < ActionMailer::Base
  default from: "thelifeapp@srv1.thelifeapp.com"

  def signup_instructions(invite_request)
    @user, @group = invite_request.sender, invite_request.group
    email = invite_request.email

    mail to: email,
      subject: t('email.invitation.subject', group_name: @group.name)
  end
end
