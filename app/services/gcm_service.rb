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

    gcm_error = get_error(gcm_result)
    if gcm_error
      Rails.logger.tagged('GCM') { Rails.logger.error "Send Notification Error: #{gcm_result}"}
      invite_request.errors.add(:receiver, I18n.t('errors.messages.push_send_notification'))

      # handle broken registration IDs
      if gcm_error == 'InvalidRegistration' || gcm_error == 'NotRegistered'
        destination_user.push_registration = nil
        destination_user.save
      end
    end

    !gcm_error
  end


  def send_event_notifications(event, destination_users)
    if destination_users.count > 0

      #create the GCM message
      notification = {app_type: 'event'}
      notification[:id] = event.id
      notification[:user_id] = event.user_id
      notification[:user_name] = event.user_name
      notification[:friend_id] = event.friend_id
      notification[:friend_name] = event.friend_name
      notification[:activity_id] = event.activity_id
      notification[:event_id] = event.target_event_id
      notification[:description] = event.description
      notification[:created_at] = event.created_at.to_i
      notification[:prayer_requested] = event.prayer_requested
      notification[:pledges_count] = event.pledges_count
      notification[:has_pledged] = false # group members haven't seen this event yet, so they could not have pledged
      notification[:threshold_id] = event.threshold_id

      # registration ids
      push_registrations = []
      destination_users.each {|u| push_registrations << u.push_registration unless u.push_registration.nil? || u.push_registration.blank? }

      if destination_users.count != push_registrations.count
        Rails.logger.tagged('GCM') { Rails.logger.error "Missing registrations: #{destination_users.count} users, #{push_registrations.count} regs" }
      end

      # tell GCM to push the message to devices
      if push_registrations.count > 0
        gcm_result = @gcm.send_notification(push_registrations, { data: notification } )

        if get_error(gcm_result)
           Rails.logger.tagged('GCM') { Rails.logger.error "Send Notification Error: #{gcm_result}"}
        end
      end

      # method always succeeds
      true
    end
  end


  private

  # @return the error or nil if no error
  def get_error(gcm_result)
    return 'GCM server failed' if gcm_result.nil?
    return gcm_result[:response] if gcm_result[:status_code] < 200 || gcm_result[:status_code] > 299

    gcm_result_body = gcm_result[:body] && JSON.parse(gcm_result[:body], { symbolize_names: true })
    return 'GCM call failed' if gcm_result_body.nil?
    return gcm_result_body[:results].first[:error] if gcm_result_body[:failure] > 0

    nil
  end

end