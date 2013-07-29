class V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  self.responder = ApiResponder
  wrap_parameters :user

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:user, attributes: :user_params)

  def create
    if params[:authentication_token] && params[:provider] == 'google'
      # register with google account
      validator = GoogleIDToken::Validator.new
      google_account = validator.check(params[:authentication_token],
                                       GoogleAccounts.config["web_client_id"],
                                       GoogleAccounts.config["android_client_id"])

      # TODO: remove for production (this is the debug client id)
      if google_account.nil? && GoogleAccounts.config["android_client_id2"]
        google_account = validator.check(params[:authentication_token],
                                         GoogleAccounts.config["web_client_id"],
                                         GoogleAccounts.config["android_client_id2"])
      end

      if google_account.nil?
        user.errors.add(:external_account, I18n.t('errors.messages.no_access'))
        respond_with(user)
      else
        user.uid = google_account["id"]
        user.provider = 'google'
        user.authentication_token = nil # remove Google token; so it will be replaced by the Devise token
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
