class UserSerializer < BaseSerializer
  attributes :id,
    :authentication_token,
    :email,
    :first_name,
    :last_name,
    :mobile

  def attributes
    hash = super

    hash.merge! image_attributes

    hash
  end
end
