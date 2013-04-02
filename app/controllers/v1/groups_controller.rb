class V1::GroupsController < ApplicationController
  expose(:groups)

  def create
    group = GroupCreationService.new(current_user, group_params).create
    respond_with(group)
  end

  def index
    respond_with(groups)
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
