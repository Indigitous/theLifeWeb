class V1::MyFriendsController < ApplicationController
  expose(:my_friends) { current_user.friends }

  def index
    respond_with(my_friends)
  end
end
