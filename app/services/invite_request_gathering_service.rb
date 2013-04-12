class InviteRequestGatheringService
  def initialize(user)
    @user = user
  end

  def gather
    normalize(received_personally + received_in_groups)
  end

  private

  def normalize(invite_requests)
    invite_requests.sort_by(&:id).reverse
  end

  def received_personally
    InviteRequest.where(email: @user.email, kind: InviteRequest::INVITE)
  end

  def received_in_groups
    InviteRequest.where(group_id: owned_group_ids, kind: InviteRequest::REQUEST_MEMBERSHIP)
  end

  def owned_group_ids
    @user.owned_groups.pluck(:id)
  end
end
