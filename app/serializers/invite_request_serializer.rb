class InviteRequestSerializer < BaseSerializer
  attributes :id, :user_id, :group_id, :created_at
  attribute :kind, key: :type
end
