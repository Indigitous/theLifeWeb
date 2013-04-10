class InviteRequestAcceptor
  def initialize(current_user, invite_request, params)
    @current_user, @invite_request, @params = current_user, invite_request, params
  end

  def process
    group_exists? &&
    user_is_not_member_of_group? &&
    invite_request_valid? &&
    invite_request_processed?

    @invite_request
  end

  private

  def group_exists?
    unless group.present?
      errors.add(:group, 'does not exist')
      return false
    end

    true
  end

  def user_is_not_member_of_group?
    if members.exists?(id: user_id) || group.owner == user
      errors.add(:user, 'is already a group member')
      return false
    end

    true
  end

  def invite_request_valid?
    @invite_request.invite? ? true : request_valid?
  end

  def invite_request_processed?
    members << user
    @invite_request.destroy
  end

  def request_valid?
    unless group.owner == @current_user
      errors.add(:user, 'is not owner')
      return false
    end

    true
  end

  def errors
    @invite_request.errors
  end

  def members
    group.users
  end

  def group
    @group ||= Group.find_by_id(group_id)
  end

  def group_id
    @params[:group_id]
  end

  def user
    @user = User.find_by_id(user_id)
  end

  def user_id
    @params[:user] || @params[:user_id]
  end
end
