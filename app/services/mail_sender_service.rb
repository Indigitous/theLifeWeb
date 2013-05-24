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
      "Hello #{@recipient_email},<br /><small>(le texte en suit)</small><br />",
      "#{@sender.full_name} has invited you to join the beta test of theLife Mobile App! theLife App is a smart evangelism toolbox with the goal of helping you connect your friends to Jesus in meaningful ways. It'll help you evaluate what their current needs are in their journey, and suggest ways to help them take the next step towards knowing God.<br />",
      "You can <a href=\"https://play.google.com/store/apps/details?id=com.p2c.thelife&feature=search_result#?t=W251bGwsMSwyLDEsImNvbS5wMmMudGhlbGlmZSJd\">download it for Android on the Google Play store</a>. If you don&#39;t have an Android device, please stay tuned, we&#39;ll be releasing an iPhone version soon!<br />",
      "Yours,<br />theLife App team<br />",
      "Bonjour #{@recipient_email},<br />",
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
