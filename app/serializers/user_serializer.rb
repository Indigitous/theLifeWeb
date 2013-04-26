class UserSerializer < BaseSerializer
  include ImageAttributes

  attributes :id,
    :authentication_token,
    :email,
    :first_name,
    :last_name,
    :mobile,
    :locale
end
