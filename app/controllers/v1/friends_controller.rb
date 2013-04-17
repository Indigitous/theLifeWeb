class V1::FriendsController < V1::BaseController
  expose(:friends, ancestor: :current_user)
  expose(:friend, attributes: :friend_params)

  def create
    friend.save
    respond_with(friend)
  end

  def update
    friend.save
    head :no_content
  end

  def destroy
    FriendDeletionService.new(current_user, params).delete
    head :no_content
  end

  private

  def friend_params
    allowed_params = [
      :first_name,
      :last_name,
      :threshold_id,
      :email,
      :mobile
    ]

    params.require(:friend).permit(*allowed_params)
  end
end
