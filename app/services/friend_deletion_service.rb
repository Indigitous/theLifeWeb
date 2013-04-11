class FriendDeletionService
  def initialize(user, params)
    @user, @params = user, params
  end

  def delete
    friend_exists? && friend_deleted?
  end

  private

  def friend_exists?
    friend.present?
  end

  def friend_deleted?
    friend.destroy

    !friend.persisted?
  end

  def friend
    @friend ||= @user.friends.find_by_id(@params[:id])
  end
end
