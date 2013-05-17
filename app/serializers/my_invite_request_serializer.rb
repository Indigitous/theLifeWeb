class MyInviteRequestSerializer < InviteRequestSerializer
  attributes :group_name,
    :sender_full_name,
    :status,
    :recipient_full_name,
    :recipient_email
end
