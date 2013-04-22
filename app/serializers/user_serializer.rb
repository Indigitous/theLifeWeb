class UserSerializer < BaseSerializer
  attributes :id,
    :authentication_token,
    :email,
    :first_name,
    :last_name,
    :mobile,
    :locale

  def attributes
    hash = super

    hash.merge! image_attributes

    hash
  end
end
