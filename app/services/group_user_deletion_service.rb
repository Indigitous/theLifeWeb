class GroupUserDeletionService
  def initialize(owner, params)
    @owner, @params = owner, params
  end

  def exclude
    group_exists? &&
    user_is_a_member? &&
    user_is_not_an_owner? &&
    user_excluded?
  end

  private

  def group_exists?
    group.present?
  end

  def user_is_a_member?
    group.users.include?(excluding_user)
  end

  def user_is_not_an_owner?
    excluding_user != @owner
  end

  def user_excluded?
    group.users.delete(excluding_user)
  end

  def group
    @group ||= @owner.owned_groups.find_by_id(@params[:group_id])
  end

  def excluding_user
    @excluding_user ||= User.find_by_id(@params[:id])
  end
end
