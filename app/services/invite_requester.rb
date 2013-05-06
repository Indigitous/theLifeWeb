class InviteRequester
  def initialize(user, params)
    @user, @params = user, params
  end

  def create
    group_exists? &&
    user_is_not_member_of_group? &&
    invite_request_saved?

    invite_request
  end

  private

  def normalize_email_and_sms
    invite_request.email = group.owner_email
    invite_request.sms = group.owner_mobile
  end

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

  def user_is_not_member_of_group?
    if group.users.exists?(id: @user.id) || group.owner == @user
      errors.add(:user, I18n.t('errors.messages.is_already_a_group_member'))
      return false
    end

    true
  end

  def build_invite_request
    InviteRequest.new(@params) do |invite_request|
      invite_request.user = @user
      invite_request.kind = InviteRequest::REQUEST_MEMBERSHIP
    end
  end

  def invite_request_saved?
    normalize_email_and_sms
    invite_request.save
  end

  def errors
    invite_request.errors
  end

  def group
    @group ||= Group.where(id: group_id).includes(:owner).first
  end

  def group_id
    @params[:group_id]
  end
end
