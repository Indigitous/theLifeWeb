class V1::SessionsController < Devise::SessionsController
  respond_to :json
  self.responder = ApiResponder
  wrap_parameters :user

  def create

    # log in with google account
    if params[:authentication_token] && params[:provider] == "google"

      puts "LOGIN WITH GOOGLE"
      validator = GoogleIDToken::Validator.new
      google_account = validator.check(params[:authentication_token],
                                       "900671345436.apps.googleusercontent.com",
                                       "900671345436-9nlj2spdq75l60eq4j6sbmo27p9crmei.apps.googleusercontent.com")

      if google_account.nil?
        user = User.new
        user.errors.add(:external_account, I18n.t('errors.messages.no_access'))
        respond_with(user)
      else
        # TODO check for email match, etc

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
