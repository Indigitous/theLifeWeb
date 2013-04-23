class UserSerializer < BaseSerializer
  attributes :id,
    :authentication_token,
    :email,
    :first_name,
    :last_name,
    :mobile

  def attributes
    super.merge(image_attributes)
  end
end
