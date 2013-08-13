# Google Cloud Messaging
class GCMService

  def initialize
    @gcm = GCM.new(Google.config["gcm_server_api_key"])
  end


  def send_notification(invite_request, destination_user)

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
  end

end