class MyInviteRequestSerializer < InviteRequestSerializer
  attributes :group_name,
    :sender_full_name,
    :status,
    :recipient_full_name,
    :recipient_email,
    :user_name   # TODO compatibility with Android 0.81
end
