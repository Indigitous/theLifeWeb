class V1::BaseController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  self.responder = ApiResponder

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end