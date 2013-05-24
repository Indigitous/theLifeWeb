class V1::UsersController < V1::BaseController
  expose(:group)
  expose(:users, ancestor: :group)

  # include_server_timestamp only: :index # TODO Android 0.81 compatibility; separate data and meta/server_timestamp fields

  wrap_parameters :user, exclude: [Devise.token_authentication_key]

  def index
    self.users = TimestampFilteringService.new(users, params[:timestamp]).filter

    respond_with(users)
  end

  def update
    current_user.attributes = user_params
    current_user.save

    respond_with(current_user)
  end

  def destroy
    GroupUserDeletionService.new(current_user, params).exclude
    head :no_content
  end

  private

  def user_params
    allowed_params = [
      :first_name,
      :last_name,
      :email,
      :mobile,
      :locale,
      :image
    ]

    params.require(:user).permit(*allowed_params)
  end
end
