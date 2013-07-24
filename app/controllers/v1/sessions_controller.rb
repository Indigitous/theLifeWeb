class V1::SessionsController < Devise::SessionsController
  respond_to :json
  self.responder = ApiResponder
  wrap_parameters :user

  def create

    if params[:authentication_token] && params[:provider] == "google"
      # log in with google account
      validator = GoogleIDToken::Validator.new
      google_account = validator.check(params[:authentication_token],
                                       GoogleAccounts.config["web_client_id"],
                                       GoogleAccounts.config["android_client_id"])

      if google_account.nil?
        user = User.new
        user.errors.add(:external_account, I18n.t('errors.messages.no_access'))
        respond_with(user)
      else
        # find the user account with the matching uid and provider
        user = User.where("uid=? AND provider='google'", google_account['id']).first
        respond_with(user)
      end
    else
      # manual log in
      user = AuthenticationService.new(warden).authenticate!

      # make sure a manual login does not work for external token accounts
      respond_with(user.provider.nil? ? user : nil)
    end
  end
end
