class InviteRequester
  def initialize(user, group, params)
    @user, @group, @params = user, group, params
  end

  def create
    user_is_group_owner? &&
    receiver_is_not_member_of_group? &&
    invite_request_saved?
  end

  def invite_request
    @invite_request ||= build_invite_request
  end

  private

  def user_is_group_owner?
    unless @group.owner == @user
      errors.add(:user, 'is not owner')
      return false
    end

    true
  end

  def receiver_is_not_member_of_group?
    if @group.users.exists?(email: email)
      errors.add(:receiver, 'is already a group member')
      return false
    end

    true
  end

  def invite_request_saved?
    invite_request.save
  end

  def build_invite_request
    InviteRequest.new(@params) do |invite_request|
      invite_request.user = @user
      invite_request.group = @group
    end
  end

  def email
    invite_request.receiver
  end

  def errors
    invite_request.errors
  end
end
