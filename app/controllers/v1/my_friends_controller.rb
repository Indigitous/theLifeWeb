class V1::MyFriendsController < V1::BaseController
  expose(:my_friends) { current_user.friends }

  def index
    respond_with(my_friends)
  end
end
