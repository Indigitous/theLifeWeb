# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create! do |user|
  user.email = 'vladimir.mikhailov@flatstack.com'
  user.password = 'passw0rd'
  user.password_confirmation = 'passw0rd'
end
