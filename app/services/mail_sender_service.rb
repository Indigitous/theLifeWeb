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
      "#{@recipient_email} vous a invit&eacute; &agrave; vous joindre au test b&ecirc;ta de laVie Mobile. laVie Mobile est un atelier intelligent pour l'&eacute;vang&eacute;lisation, qui a comme but de vous aider &agrave; connecter vos amis avec J&eacute;sus de fa&ccedil;on significative. Il vous aidera &agrave; &eacute;valuer o&ugrave; vos amis sont dans leur cheminement, et sugg&eacute;rera des actions concr&egrave;tes pour les aider &agrave; prendre le prochain pas vers Dieu.<br />",
      "Vous pouvez le <a href=\"https://play.google.com/store/apps/details?id=com.p2c.thelife&feature=search_result#?t=W251bGwsMSwyLDEsImNvbS5wMmMudGhlbGlmZSJd\">t&eacute;l&eacutecharger pour Android sur Google Play</a>. Si vous n'avez pas d'appareil Android, nous sortirons la version iPhone bient&ocirc;t.<br />",
     "Cordialement,<br />l'&eacute;quile laVie Mobile",
    ].join("<br />")

    @message_hash = {
      subject: 'test laVie Mobile / theLife Mobile App Beta',
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
