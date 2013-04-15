class V1::MyUsersController < V1::BaseController
  expose(:my_users) { current_user.visible_profiles }
  expose(:my_user)

  def show
    respond_with(my_user, serializer: MyUserSerializer)
  end
end
