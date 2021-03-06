class InviteRequestGatheringService
  def initialize(user)
    @user = user
  end

  def gather
    normalize(received_personally + received_in_groups + created_by_me)
  end

  private

  def normalize(invite_requests)
    invite_requests.sort_by(&:id).reverse
  end

  def created_by_me
    @user
      .invite_requests
      .accepted_or_rejected
      .includes(:group)
  end

  def received_personally
    InviteRequest
      .where(email: @user.email, kind: InviteRequest::INVITE)
      .delivered
      .includes(:sender, :group)
  end

  def received_in_groups
    InviteRequest
      .where(group_id: owned_group_ids, kind: InviteRequest::REQUEST_MEMBERSHIP)
      .delivered
      .includes(:sender, :group)
  end

  def owned_group_ids
    @user.owned_groups.pluck(:id)
  end
end
