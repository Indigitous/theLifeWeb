class MyUserSerializer < BaseSerializer
  include ImageAttributes

  attributes :email,
    :first_name,
    :last_name,
    :mobile
end
