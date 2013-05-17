class MyInviteRequestSerializer < InviteRequestSerializer
  attributes :group_name, :sender_name, :status, :recipient_name, :recipient_email
end
