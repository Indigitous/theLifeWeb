class InvitationMailer < ActionMailer::Base
  default from: "from@example.com"

  def signup_instructions(invite_request)
    @user, @group = invite_request.user, invite_request.group
    email = invite_request.email

    mail to: email,
      subject: "You have been invited to #{@group.name}"
  end
end
