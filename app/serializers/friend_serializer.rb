class FriendSerializer < BaseSerializer
  attributes :id,
    :first_name,
    :last_name,
    :email,
    :mobile,
    :threshold_id

  def attributes
    hash = super

    hash.merge! image_attributes

    hash
  end
end
