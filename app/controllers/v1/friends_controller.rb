class V1::FriendsController < ApplicationController
  expose(:friends, ancestor: :current_user)
  expose(:friend, attributes: :friend_params)

  respond_to :json

  def create
    friend.save
    respond_with(friend, location: nil)
  end

  private

  def friend_params
    params.require(:friend).permit(:first_name, :last_name)
  end
end
