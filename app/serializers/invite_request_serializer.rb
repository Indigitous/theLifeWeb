class InviteRequestSerializer < BaseSerializer
  attributes :id, :user_id, :group_id
  attribute :kind, key: :type
end
