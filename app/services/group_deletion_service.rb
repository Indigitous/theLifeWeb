class GroupDeletionService
  def initialize(user, params)
    @user, @params = user, params
  end

  def destroy
    group_exists? &&
    group_destroyed?
  end

  private

  def group_exists?
    group.present?
  end

  def group_destroyed?
    group.destroy

    !group.persisted?
  end

  def group
    @group ||= @user.owned_groups.find_by_id(group_id)
  end

  def group_id
    @params[:id]
  end
end
