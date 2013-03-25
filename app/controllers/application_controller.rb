class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_filter :authenticate_user!

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  respond_to :json
end
