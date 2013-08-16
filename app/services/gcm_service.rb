# Google Cloud Messaging
class GCMService

  def initialize
    @gcm = GCM.new(Google.config["gcm_server_api_key"])
  end


  # @return true if sent successfully, false for any kind of failure. invite_request will contain the error, if any.
  def send_invite_request_notification(invite_request, destination_user)

    # create the GCM message
    notification = {app_type: 'request'}
    notification[:id] = invite_request.id
    notification[:user_id] = invite_request.sender.id
    notification[:sender_full_name] = invite_request.sender.full_name
    notification[:group_id] = invite_request.group_id
    notification[:group_name] = invite_request.group.name
    notification[:type] = invite_request.kind
    notification[:email] = invite_request.email
    notification[:sms] = invite_request.sms
    notification[:updated_at] = invite_request.created_at.to_i
    notification[:status] = invite_request.status
    if (invite_request.recipient)
      notification[:recipient_id] = invite_request.recipient.id
      notification[:recipient_full_name] = invite_request.recipient.full_name
    end

    # tell GCM to push the message to device
    gcm_result = @gcm.send_notification([destination_user.push_registration], { data: notification } )

    # handle possible errors
    gcm_error = parse_error(gcm_result)
    if gcm_error
      invite_request.errors.add(:receiver, I18n.t('errors.messages.push_send_notification'))
    end

    # handle broken registration IDs
    if gcm_error == "InvalidRegistration" || gcm_error == "NotRegistered"
      destination_user.push_registration = nil
      destination_user.save
    end

    !gcm_error
  end


  def send_event_notifications(event, destination_users)
    if destination_users.count > 0

      #create the GCM message
      notification = {app_type: 'event'}
      notification[:id] = event.id

      # registration ids
      registration_ids = []
      destination_users.each {|u| registration_ids << u.push_registration unless u.push_registration.nil? || u.push_registration.blank? }

      # TODO what if not every user has a registration_id?

      # tell GCM to push the message to devices
      gcm_result = @gcm.send_notification([destination_users.push_registration], { data: notification } )

      # TODO what about gcm errors?

      true
    end
  end


  private

  def parse_error(gcm_result)
    gcm_result_body = gcm_result[:body] && JSON.parse(gcm_result[:body], { symbolize_names: true })
    return gcm_result_body && gcm_result_body[:failure] > 0 && gcm_result_body[:results].first[:error]
  end

end