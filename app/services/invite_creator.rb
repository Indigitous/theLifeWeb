# Group leader is inviting a person to join the group.
class InviteCreator
  def initialize(user, params)
    @user, @params = user, params
    @gcm_service = GCMService.new
  end

  def create
    group_exists? &&
    user_is_group_owner? &&
    receiver_is_valid? &&
    invite_request_saved? &&
    signup_instructions_sent? &&
    @gcm_service.send_invite_request_notification(invite_request, invite_request.recipient)

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
    invite_request.email.blank? ||
    #InvitationMailer.signup_instructions(invite_request).deliver
    MailSenderService.new(invite_request).send_signup_instructions
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
end
