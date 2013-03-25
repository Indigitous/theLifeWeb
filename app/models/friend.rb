class Friend < ActiveRecord::Base
  belongs_to :user

  validates :first_name,
    :last_name,
    :user,
    presence: true
end
