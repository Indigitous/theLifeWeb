class V1::MyFriendsController < V1::BaseController
  expose(:my_friends) { current_user.friends }
  # include_server_timestamp only: :index # TODO Android 0.81 compatibility; separate data and meta/server_timestamp fields

  def index
    friends = TimestampFilteringService.new(my_friends, params[:timestamp]).filter

    respond_with(friends)
  end
end
