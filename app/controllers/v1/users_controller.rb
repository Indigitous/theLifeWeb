class V1::UsersController < V1::BaseController
  expose(:group)
  expose(:users, ancestor: :group)

  wrap_parameters :user, exclude: [
    Devise.token_authentication_key,
    :android_device
  ]

  def index
    respond_with(users)
  end

  def update
    android_device = current_user.android_device
    android_device.registration_id = params[:android_device][:registration_id]
    android_device.save

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
