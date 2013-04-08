class V1::UsersController < V1::BaseController
  expose(:group)
  expose(:users, ancestor: :group)

  def index
    respond_with(users)
  end
end
