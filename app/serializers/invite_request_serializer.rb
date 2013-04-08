class InviteRequestSerializer < BaseSerializer
  attributes :id, :user_id, :group_id, :type

  def type
    object.kind
  end
end
