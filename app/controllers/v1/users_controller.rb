class V1::UsersController < V1::BaseController
  expose(:group)
  expose(:users, ancestor: :group)

  def index
    respond_with(users)
  end

  def destroy
    GroupUserDeletionService.new(current_user, params).exclude
    head :no_content
  end
end
