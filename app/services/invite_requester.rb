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

  def invite_request
    @invite_request ||= build_invite_request
  end

  def group_exists?
    unless group.present?
      errors.add(:group, 'does not exist')
      return false
    end

    true
  end

  def user_is_not_member_of_group?
    if group.users.exists?(id: @user.id) || group.owner == @user
      errors.add(:user, 'is already a group member')
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
    invite_request.save
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
