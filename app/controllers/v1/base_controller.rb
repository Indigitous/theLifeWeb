class V1::BaseController < ApplicationController
  respond_to :json
  before_filter :skip_trackable, :authenticate_user!, :set_locale

  self.responder = ApiResponder

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end

  def set_locale
    I18n.locale = current_user_locale || I18n.default_locale
  end

  def current_user_locale
    current_user.locale if user_signed_in?
  end
end
