class V1::ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json
end
