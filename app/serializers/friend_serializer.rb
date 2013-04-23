class FriendSerializer < BaseSerializer
  attributes :id,
    :first_name,
    :last_name,
    :email,
    :mobile,
    :threshold_id

  def attributes
    super.merge(image_attributes)
  end
end
