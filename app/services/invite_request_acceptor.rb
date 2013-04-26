class InviteRequestAcceptor
  attr_accessor :invite_request

  delegate :errors, :group_id, to: :invite_request

  def initialize(current_user, invite_request, params)
    @current_user, @invite_request, @params = current_user, invite_request, params
  end

  def process
    group_exists? &&
    user_exists? &&
    user_is_not_member_of_group? &&
    invite_request_valid? &&
    invite_request_processed?

    invite_request.errors.any? ? invite_request : membership
  end

  private

  def group_exists?
    unless group.present?
      errors.add(:group, 'does not exist')
      return false
    end

    true
  end

  def user_exists?
    unless user.present?
      errors.add(:user, 'does not exist')
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
    invite_request.valid? && invite_request_can_be_processed?
  end

  def invite_request_can_be_processed?
    invite_request.invite? ? invite_belongs_to_user? : user_is_a_group_owner?
  end

  def invite_request_processed?
    members << user
    invite_request.destroy
  end

  def invite_belongs_to_user?
    unless user.received_invite_requests.exists?(id: invite_request.id)
      errors.add(:user, 'is not owner')
      return false
    end

    true
  end

  def user_is_a_group_owner?
    unless group.owner == @current_user
      errors.add(:user, 'is not owner')
      return false
    end

    true
  end

  def members
    group.users
  end

  def membership
    user.group_users.where(group_id: group_id).first
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
