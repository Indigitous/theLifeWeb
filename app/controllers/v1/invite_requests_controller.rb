class V1::InviteRequestsController < V1::BaseController
  expose(:requests_to_delete) do
    current_user.invite_requests.accepted_or_rejected
  end
  expose(:request_to_delete, ancestor: :requests_to_delete)

  expose(:invite_request)

  def create
    invite_request = creation_service.new(current_user, invite_request_params).create
    respond_with(invite_request)
  end

  def handle
    if params[:accept].to_s == 'true'
      result = InviteRequestAcceptor.new(current_user, invite_request, params).process
      respond_with(result)
    else
      _invite_request = InviteRequestRejector.new(current_user, invite_request, params).process
      if _invite_request.errors.any?
        respond_with(_invite_request)
      else
        head :no_content
      end
    end
  end

  def destroy
    request_to_delete.destroy
    head :no_content
  end

  private

  def invite_request_params
    params.require(:invite_request).permit(:group_id, :email, :sms)
  end

  def creation_service
    params[:type] == 'INVITE' ? InviteCreator : InviteRequester
  end
end
