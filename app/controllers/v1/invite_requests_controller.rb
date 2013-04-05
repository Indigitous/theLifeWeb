class V1::InviteRequestsController < ApplicationController
  def create
    invite_request = service.new(current_user, invite_request_params).create
    respond_with(invite_request)
  end

  private

  def invite_request_params
    params.require(:invite_request).permit(:group_id, :email, :sms)
  end

  def service
    params[:type] == 'INVITE' ? InviteCreator : InviteRequester
  end
end
