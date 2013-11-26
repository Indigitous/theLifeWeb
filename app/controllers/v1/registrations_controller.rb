class V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  self.responder = ApiResponder
  wrap_parameters :user

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  expose(:user, attributes: :user_params)

  def create
    if params[:authentication_token]

      external_account = nil
      if params[:provider] == 'google'
        # register with google account
        validator = GoogleIDToken::Validator.new

        (1..4).each do
          # P2C client id
          if external_account.nil? && Google.config['accounts_android_client_id3']
            external_account = validator.check(params[:authentication_token],
                                             Google.config['accounts_web_client_id'],
                                             Google.config['accounts_android_client_id3'])
          end

          # TODO: remove for production (this is the debug/developer client id)
          if external_account.nil? && Google.config['accounts_android_client_id2']
             external_account = validator.check(params[:authentication_token],
                                              Google.config['accounts_web_client_id'],
                                              Google.config['accounts_android_client_id2'])
          end

          # TODO: remove for production (this is the debug/developer client id)
          if external_account.nil? && Google.config['accounts_android_client_id']
            external_account = validator.check(params[:authentication_token],
                                         Google.config['accounts_web_client_id'],
                                         Google.config['accounts_android_client_id'])
          end

          # HACK: does this make it work?
          if external_account.nil? do
            sleep 2
            Rails.logger.tagged('GOOGLE') { Rails.logger.error("Authentication Error With Token: #{params[:authentication_token]}") }
          end
        end

        if external_account.nil?
          Rails.logger.tagged('GOOGLE') { Rails.logger.error("Authentication FAILED With Token: #{params[:authentication_token]}") }
        end
      end

      elsif params[:provider] == 'facebook'
        # register with facebook account
        begin
          graph = Koala::Facebook::API.new(params[:authentication_token])
          external_account = graph.get_object('me')
        rescue Koala::Facebook::AuthenticationError => e
          Rails.logger.tagged('FACEBOOK') { Rails.logger.error("Authentication Error: #{e}") }
        end
      end

      if external_account.nil?
        user.errors.add(:external_account, I18n.t('errors.messages.no_access'))
        respond_with(user)
      else
        user.uid = external_account['id']
        user.provider = params[:provider]
        user.authentication_token = nil # remove external token; it will be replaced by the Devise token
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
