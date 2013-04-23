class FriendSerializer < BaseSerializer
  include ImageAttributes

  attributes :id,
    :first_name,
    :last_name,
    :email,
    :mobile,
    :threshold_id
end
