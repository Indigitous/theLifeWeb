class V1::RegistrationsController < Devise::RegistrationsController
  wrap_parameters :user

  expose(:user, attributes: :user_params)

  def create
    user.save
    respond_with(user, location: nil)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
