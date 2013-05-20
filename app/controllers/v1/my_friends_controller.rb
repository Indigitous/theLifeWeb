class V1::MyFriendsController < V1::BaseController
  expose(:my_friends) { current_user.friends }

  def index
    friends = TimestampFilteringService.new(my_friends, params[:timestamp]).filter

    respond_with(friends)
  end
end
