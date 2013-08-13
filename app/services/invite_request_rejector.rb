class InviteRequestRejector
  attr_accessor :invite_request

  delegate :errors, :group_id, to: :invite_request

  def initialize(current_user, invite_request, params)
    @current_user, @invite_request, @params = current_user, invite_request, params
    @gcm_service = GCMService.new
  end

  def process
    user_exists? &&
    invite_request_valid? &&
    invite_request_processed? &&
    @gcm_service.send_notification(invite_request, invite_request.sender)

    invite_request
  end

  private

  def user_exists?
    unless user.present?
      errors.add(:user, I18n.t('errors.messages.does_not_exist'))
      return false
    end

    true
  end

  def invite_request_valid?
    invite_request.invite? ? invite_belongs_to_user? : user_is_a_group_owner?
  end

  def invite_request_processed?
    invite_request.update_attributes(status: InviteRequest::REJECTED)
  end

  def invite_belongs_to_user?
    unless user.received_invite_requests.exists?(id: invite_request.id)
      errors.add(:user, I18n.t('errors.messages.is_not_owner'))
      return false
    end

    true
  end

  def user_is_a_group_owner?
    unless group.owner == @current_user
      errors.add(:user, I18n.t('errors.messages.is_not_owner'))
      return false
    end

    true
  end

  def group
    @group ||= Group.find_by_id(group_id)
  end


  def user
    @user = User.find_by_id(user_id)
  end

  def user_id
    @params[:user] || @params[:user_id]
  end
end
