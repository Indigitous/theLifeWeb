class InviteRequestRejector
  attr_accessor :invite_request

  def initialize(current_user, invite_request, params)
    @current_user, @invite_request, @params = current_user, invite_request, params
  end

  def process
    invite_request_valid? &&
    invite_request_processed?

    invite_request
  end

  private

  def invite_request_valid?
    invite_request.invite? ? invite_valid? : request_valid?
  end

  def invite_request_processed?
    invite_request.destroy
  end

  def invite_valid?
    unless user.received_invite_requests.exists?(id: invite_request.id)
      errors.add(:user, 'is not owner')
      return false
    end

    true
  end

  def request_valid?
    unless group.owner == @current_user
      errors.add(:user, 'is not owner')
      return false
    end

    true
  end

  def errors
    invite_request.errors
  end

  def group
    @group ||= Group.find_by_id(group_id)
  end

  def group_id
    invite_request.group_id
  end

  def user
    @user = User.find_by_id(user_id)
  end

  def user_id
    @params[:user] || @params[:user_id]
  end
end
