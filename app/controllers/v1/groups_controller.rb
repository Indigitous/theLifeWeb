class V1::GroupsController < V1::BaseController
  expose(:groups)

  def index
    self.groups = GroupSearchingService.new(params[:query]).find_all_matching

    respond_with(groups)
  end

  def create
    group = GroupCreationService.new(current_user, group_params).create
    respond_with(group)
  end

  def destroy
    GroupDeletionService.new(current_user, params).destroy
    head :no_content
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
