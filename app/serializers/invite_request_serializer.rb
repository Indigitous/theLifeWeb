class InviteRequestSerializer < BaseSerializer
  attributes :id, :user_id, :group_id, :updated_at
  attribute :kind, key: :type
end
