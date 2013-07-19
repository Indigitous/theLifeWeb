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
    if params[:authentication_gtoken]

      puts "REGISTER WITH GOOGLE REQUEST"
      validator = GoogleIDToken::Validator.new
      google_account = validator.check(params[:authentication_gtoken],
                                       "900671345436.apps.googleusercontent.com",
                                       "900671345436-9nlj2spdq75l60eq4j6sbmo27p9crmei.apps.googleusercontent.com")
      #google_account = validator.check(params[:authentication_token],
      #                                 "900671345436.apps.googleusercontent.com",
      #                                 "900671345436-diohqcc2cer6v05npbj08pnd8rgn9oib.apps.googleusercontent.com")

      if google_account.nil?
        # TODO check error handling
        user.errors = validator.problem
        respond_with(user)
      else
        # TODO check for email match

        #params[:provider] = "google"
        #params[:uid] = google_account[:id]
        puts "HERE ARE PARAMS"
        puts params
        puts params.except(:authentication_gtoken)
        user = User.new
        # user.attributes = params.slice(:email, :first_name, :last_name, :mobile, :locale )
        user.attributes = { email: "clarence7@ballistiq.com", password: "------", first_name: "Clarence", last_name: "Martens", mobile: "778-555-5555", locale: "en" }
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
      :authentication_gtoken
    ]

    params.require(:user).permit(*allowed_params)
  end
end
