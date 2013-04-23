class MyUserSerializer < BaseSerializer
  attributes :email,
    :first_name,
    :last_name,
    :mobile

  def attributes
    super.merge(image_attributes)
  end
end
