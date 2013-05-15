require 'rake'

class InviteCreator
  def initialize(user, params)
    @user, @params = user, params
  end

  def create
    group_exists? &&
    user_is_group_owner? &&
    receiver_is_valid? &&
    invite_request_saved? &&
    signup_instructions_sent? &&
    push_notifications_created?

    invite_request
  end

  private

  def invite_request
    @invite_request ||= build_invite_request
  end

  def group_exists?
    unless group.present?
      errors.add(:group, I18n.t('errors.messages.does_not_exist'))
      return false
    end

    true
  end

  def user_is_group_owner?
    unless group.owner == @user
      errors.add(:user, I18n.t('errors.messages.is_not_owner'))
      return false
    end

    true
  end

  def receiver_is_valid?
    receiver_email_or_sms_present? &&
    receiver_is_not_member_of_group?
  end

  def receiver_is_not_member_of_group?
    if group.users.exists?(email: email)
      errors.add(:receiver, I18n.t('errors.messages.is_already_a_group_member'))
      return false
    end

    true
  end

  def receiver_email_or_sms_present?
    if email.blank? && sms.blank?
      errors.add(:receiver, I18n.t('errors.messages.both_email_and_sms_cant_be_blank'))
      return false
    end

    true
  end

  def invite_request_saved?
    invite_request.save
  end

  def signup_instructions_sent?
    invite_request.email.blank? || InvitationMailer.signup_instructions(invite_request).deliver
  end

  def push_notifications_created?
    if receiver.present?
      create_android_push_notification
    end
  end

  def create_android_push_notification
    if receiver.android_device.present?
      notification = Gcm::Notification.new
      notification.device = receiver.android_device
      notification.data = {
        registration_ids: [ receiver.android_device.registration_id ],
        data: {
          sender_id: @user.id,
          group: group_id,
          type: 'INVITE'
        }
      }
      notification.save
    end
  end

  def build_invite_request
    InviteRequest.new(@params) do |invite_request|
      invite_request.sender = @user
    end
  end

  def email
    invite_request.email
  end

  def sms
    invite_request.sms
  end

  def errors
    invite_request.errors
  end

  def group
    @group ||= Group.find_by_id(group_id)
  end

  def group_id
    @params[:group_id]
  end

  def receiver
    User.find_by_email(email)
  end
end
