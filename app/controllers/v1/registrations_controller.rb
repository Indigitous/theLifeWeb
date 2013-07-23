class V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  self.responder = ApiResponder
  wrap_parameters :user

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:user, attributes: :user_params)

  def create
    # register with google account
    if params[:authentication_token] && params[:provider] == "google"

      validator = GoogleIDToken::Validator.new
      google_account = validator.check(params[:authentication_token],
                                       "900671345436.apps.googleusercontent.com",
                                       "900671345436-9nlj2spdq75l60eq4j6sbmo27p9crmei.apps.googleusercontent.com")
      if google_account.nil?
        user.errors.add(:external_account, I18n.t('errors.messages.no_access'))
        respond_with(user)
      else
        # TODO check for email match, etc

        user.uid = google_account["id"]
        user.provider = "google"
        user.authentication_token = nil # will be assigned a bogus one anyway, must also have bogus password on input
        user.save
        respond_with(user)
      end

    else
      # manual registration
      user.save
      respond_with(user)
    end
  end

  def destroy
    current_user.destroy
    head :no_content
  end

  private

  def user_params
    allowed_params = [
      :first_name,
      :last_name,
      :email,
      :password,
      :mobile,
      :locale,
      :authentication_token,
      :provider
    ]

    params.require(:user).permit(*allowed_params)
  end
end
