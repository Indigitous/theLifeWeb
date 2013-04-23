class V1::BaseController < ApplicationController
  respond_to :json
  before_filter :skip_trackable, :authenticate_user!

  self.responder = ApiResponder

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end
end
