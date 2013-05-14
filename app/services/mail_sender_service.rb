require 'mandrill'

class MailSenderService
  def initialize(object)
    @object = object
    @default_message_hash = {
      from_name: 'theLife',
      from_email: 'thelifeapp@srv1.thelifeapp.com'
    }
  end

  def send_signup_instructions
    @user, @group = @object.user, @object.group

    message_html = [
      I18n.t('email.invitation.greeting'),
      I18n.t('email.invitation.body', name: @user.full_name, group_name: @group.name),
      I18n.t('email.invitation.instructions'),
    ].join("<br />")

    @message_hash = {
      subject: I18n.t('email.invitation.subject', group_name: @group.name),
      html: message_html,
      to:[
        {
          email: @user.email,
          name: @user.full_name
        }
      ]
    }

    send
  end

  def send
    mandrill = Mandrill::API.new

    message = @default_message_hash.merge(@message_hash)

    sending = mandrill.messages.send message
  end
end
