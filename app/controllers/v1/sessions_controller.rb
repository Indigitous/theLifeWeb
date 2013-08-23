class V1::SessionsController < Devise::SessionsController
  respond_to :json
  self.responder = ApiResponder
  wrap_parameters :user

  def create
    if params[:authentication_token]

      external_account = nil
      user = nil
      first_name = nil
      last_name = nil
      if params[:provider] == 'google'
        # log in with google account
        validator = GoogleIDToken::Validator.new
        external_account = validator.check(params[:authentication_token],
                                         Google.config['accounts_web_client_id'],
                                         Google.config['accounts_android_client_id'])

        # TODO: remove for production (this is the debug client id)
        if external_account.nil? && Google.config['accounts_android_client_id2']
          external_account = validator.check(params[:authentication_token],
                                           Google.config['accounts_web_client_id'],
                                           Google.config['accounts_android_client_id2'])
        end

      elsif params[:provider] == 'facebook'
        # log in with facebook account
        begin
          graph = Koala::Facebook::API.new(params[:authentication_token])
          external_account = graph.get_object('me')
          first_name = external_account['first_name']
          last_name = external_account['last_name']
        rescue Koala::Facebook::AuthenticationError => e
          Rails.logger.tagged('FACEBOOK') { Rails.logger.error("Authentication Error: #{e}") }
        end
      end

      if external_account
        # find the user account with the matching uid and provider
        user = User.where('uid=? AND provider=?', external_account['id'], params[:provider]).first

        if user
          # update user record to latest from external source
          user.first_name = first_name if first_name
          user.last_name = last_name if last_name
          user.save if first_name || last_name
        end
      end

      # could not find the user account
      if user.nil?
        user = User.new
        user.errors.add(:external_account, I18n.t('errors.messages.no_access'))
      end

      respond_with(user)

    else
      # manual log in
      user = AuthenticationService.new(warden).authenticate!

      # make sure a manual login does not work for external token accounts
      respond_with(user.provider.nil? ? user : nil)
    end
  end
end
