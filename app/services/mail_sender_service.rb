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
    @sender, @group = @object.sender, @object.group
    @recipient_email = @object.email

    message_html = [
      I18n.t('email.invitation.greeting'),
      I18n.t('email.invitation.body', name: @sender.full_name, group_name: @group.name),
      I18n.t('email.invitation.instructions'),
    ].join("<br />")

    @message_hash = {
      subject: I18n.t('email.invitation.subject', group_name: @group.name),
      html: message_html,
      to:[
        { email: @recipient_email }
      ]
    }

    send
  end

  private

  def send
    if Rails.env.production?
      mandrill = Mandrill::API.new('9NLFzTBUNHNYAqEFU6vAfA') # P2C

      message = @default_message_hash.merge(@message_hash)

      mandrill.messages.send message
    end
  end
end
