class V1::GroupsController < ApplicationController
  def create
    group = GroupCreationService.new(current_user, group_params).create
    respond_with(group)
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end