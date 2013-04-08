class V1::SessionsController < Devise::SessionsController
  respond_to :json
  self.responder = ApiResponder
  wrap_parameters :user

  def create
    user = AuthenticationService.new(warden).authenticate!

    respond_with(user)
  end
end
